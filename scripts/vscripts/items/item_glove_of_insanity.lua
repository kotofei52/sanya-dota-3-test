--[[ ============================================================================================================
	Author: Rook
	Date: February 3, 2015
	A helper method that switches the keys.ability item to one with the inputted name.
================================================================================================================= ]]
function swap_to_item(keys, ItemName)
	for i=0, 5, 1 do  --Fill all empty slots in the player's inventory with "dummy" items.
		local current_item = keys.caster:GetItemInSlot(i)
		if current_item == nil then
			keys.caster:AddItem(CreateItem("item_dummy", keys.caster, keys.caster))
		end
	end
	
	keys.caster:RemoveItem(keys.ability)
	keys.caster:AddItem(CreateItem(ItemName, keys.caster, keys.caster))  --This should be put into the same slot that the removed item was in.
	
	for i=0, 5, 1 do  --Remove all dummy items from the player's inventory.
		local current_item = keys.caster:GetItemInSlot(i)
		if current_item ~= nil then
			if current_item:GetName() == "item_dummy" then
				keys.caster:RemoveItem(current_item)
			end
		end
	end
end


--[[ ============================================================================================================
	Author: Rook
	Date: February 3, 2015
	Called when Armlet (active) is cast.  Toggles the item to an inactive state.
================================================================================================================= ]]
function item_glove_of_insanity_active_on_spell_start(keys)
	keys.caster:EmitSound("DOTA_Item.Armlet.DeActivate")
	swap_to_item(keys, "item_glove_of_insanity")
end


--[[ ============================================================================================================
	Author: Rook
	Date: February 3, 2015
	Called when Armlet (inactive) is cast.  Toggles the item to an active state.  Currently, only one Armlet may be
	toggled on at a time.
================================================================================================================= ]]
function item_glove_of_insanity_on_spell_start(keys)
	while keys.caster:HasAnyAvailableInventorySpace() do  --Fill all empty slots in the player's inventory with "dummy" items.
		keys.caster:AddItem(CreateItem("item_dummy", keys.caster, keys.caster))
	end
	
	--Replace all "on" armlets with "off" ones.
	for i=0, 5, 1 do
		local current_item = keys.caster:GetItemInSlot(i)
		if current_item ~= nil then
			if current_item:GetName() == "item_glove_of_insanity_active" then
				keys.caster:RemoveItem(current_item)
				keys.caster:AddItem(CreateItem("item_glove_of_insanity", keys.caster, keys.caster))  --This should be put into the same slot that the "on" Armlet was in.
			end
		end
	end
	
	for i=0, 5, 1 do  --Remove all dummy items from the player's inventory.
		local current_item = keys.caster:GetItemInSlot(i)
		if current_item ~= nil then
			if current_item:GetName() == "item_dummy" then
				keys.caster:RemoveItem(current_item)
			end
		end
	end

	keys.caster:EmitSound("DOTA_Item.Armlet.Activate")
	swap_to_item(keys, "item_glove_of_insanity_active")  --Turn the newly toggled armlet on.
end


--[[ ============================================================================================================
	Author: Rook
	Date: February 3, 2015
	Called regularly while Armlet is toggled on.  Damages the caster.
	Additional parameters: keys.UnholyHealthDrainPerSecond and keys.UnholyHealthDrainInterval
================================================================================================================= ]]
function modifier_item_glove_of_insanity_active_on_interval_think_damage(keys)
	local new_hp = keys.caster:GetHealth() - (keys.UnholyHealthDrainPerSecond * keys.UnholyHealthDrainInterval)
	
	if new_hp < 1 then  --Armlet cannot kill the caster from its HP drain.
		new_hp = 1
	end
	
	if keys.caster:IsIllusion() then return 1
	else
		keys.caster:SetHealth(new_hp)
	end
end


--[[ ============================================================================================================
	Author: Rook
	Date: February 3, 2015
	Called regularly while Armlet is toggled on.  Gives the caster another tick's worth of Strength if they have not
	yet reached the maximum amount of Strength granted, and increases their current HP by the amount their maximum
	HP was increased by.
	Additional parameters: keys.UnholyTicksToFullEffect and keys.UnholyBonusStrength
================================================================================================================= ]]
function modifier_item_glove_of_insanity_active_apply_tick_strength_on_interval_think(keys)
	if keys.ability.ArmletTicksActive == nil or keys.ability.ArmletTicksActive < keys.UnholyTicksToFullEffect then
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_glove_of_insanity_active_tick", {duration = -1})
		
		--Update the stored amount of active Armlet ticks.
		if keys.ability.ArmletTicksActive == nil then
			keys.ability.ArmletTicksActive = 1
		else
			keys.ability.ArmletTicksActive = keys.ability.ArmletTicksActive + 1
		end
		
		--Increase the caster's current health by the same amount that their maximum health was increased by.
		local currentHP = keys.caster:GetHealth()
		local maxHP = keys.caster:GetMaxHealth()
		local health_bonus_interval_ratio = (keys.UnholyBonusStrength / keys.UnholyTicksToFullEffect) * 19  --Every point of STR increases a hero's maximum HP by 19.
		
		local amount_to_heal = ((currentHP + health_bonus_interval_ratio) / (maxHP + health_bonus_interval_ratio)) * maxHP - currentHP
		
		keys.caster:SetHealth(currentHP + amount_to_heal)
	end
end


--[[ ============================================================================================================
	Author: Rook
	Date: February 3, 2015
	Called when an active Armlet is unequipped (e.g. when it is sold or dropped).  Removes any bonus Strength 
	modifiers from the caster, and reduces their current HP by the amount their maximum HP was decreased by.
	Additional parameters: keys.UnholyTicksToFullEffect and keys.UnholyBonusStrength
================================================================================================================= ]]
function item_glove_of_insanity_active_on_unequip(keys)
	if keys.ability.ArmletTicksActive ~= nil then
		
		for i=1, keys.ability.ArmletTicksActive, 1 do
			keys.caster:RemoveModifierByName("modifier_item_glove_of_insanity_active_tick")
		end
		for i=1, keys.ability.ArmletTicksActive, 1 do
			--Reduce the caster's current HP by the amount their maximum HP will be reduced by.
			local currentHP = keys.caster:GetHealth()
			local maxHP = keys.caster:GetMaxHealth()
			local health_bonus_interval_ratio = (keys.UnholyBonusStrength / keys.UnholyTicksToFullEffect) * 19  --Every point of STR increases a hero's maximum HP by 19.
			local amount_to_damage = ((currentHP + health_bonus_interval_ratio) / (maxHP + health_bonus_interval_ratio)) * maxHP - currentHP
			local new_hp = currentHP - amount_to_damage
			if new_hp < 1 then
				new_hp = 1
			end
			keys.caster:SetHealth(new_hp)
		end
		keys.ability.ArmletTicksActive = nil
	end
end


--[[ ============================================================================================================
	Author: Rook
	Date: February 4, 2015
	Called when the unit lands an attack on a target.  Applies a brief lifesteal modifier if not attacking a structure 
	(Lifesteal blocks in KV files will normally allow the unit to heal when attacking these).
================================================================================================================= ]]
function modifier_item_glove_of_insanity_on_orb_impact(keys)
	if keys.target.GetInvulnCount == nil then
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.attacker, "modifier_item_glove_of_insanity_lifesteal", {duration = 0.03})
	end
end


function modifier_item_glove_of_insanity_active_apply_tick_strength_on_interval_think2(keys)
	--Increase the caster's current health by the same amount that their maximum health was increased by.
	local currentHP = keys.caster:GetHealth()
	local maxHP = keys.caster:GetMaxHealth()

	local amount_to_heal = 700 + currentHP - ((maxHP + 700) * (currentHP / maxHP))
	
	keys.caster:SetHealth(currentHP + amount_to_heal)
end

function item_glove_of_insanity_active_on_unequip2(keys)
	--Reduce the caster's current HP by the amount their maximum HP will be reduced by.
	local currentHP = keys.caster:GetHealth()
	local maxHP = keys.caster:GetMaxHealth()

	local amount_to_damage = 700 + currentHP - ((maxHP + 700) * (currentHP / maxHP))
	local new_hp = currentHP - amount_to_damage
	if new_hp < 1 then
		new_hp = 1
	end
	keys.caster:SetHealth(new_hp)
end

function item_glove_of_insanity_on_drop(keys)
	if keys.ability:GetToggleState() then
		keys.ability:ToggleAbility()
	end
end