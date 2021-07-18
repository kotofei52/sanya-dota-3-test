--[[ ============================================================================================================
	Author: Rook
	Date: February 2, 2015
	Called when a Battle Fury is acquired.  Grants the cleave modifier if the caster is a melee hero.
================================================================================================================= ]]
function modifier_item_cleaver_on_created(keys)
	if not keys.caster:IsRangedAttacker() then
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_cleaver_cleave", {duration = -1})
	end
end


--[[ ============================================================================================================
	Author: Rook
	Date: February 2, 2015
	Called when a Battle Fury is removed from the caster's inventory.  Removes a cleave modifier if they are a melee hero.
================================================================================================================= ]]
function modifier_item_cleaver_on_destroy(keys)
	if not keys.caster:IsRangedAttacker() then
		keys.caster:RemoveModifierByName("modifier_item_cleaver_cleave")
	end
end


--[[ ============================================================================================================
	Author: Rook
	Date: February 2, 2015
	Called regularly while the caster has a Battle Fury in their inventory.  If the caster has switched from ranged
	to melee, give them cleave modifier(s).
================================================================================================================= ]]
function modifier_item_cleaver_on_interval_think(keys)
	if not keys.caster:IsRangedAttacker() and not keys.caster:HasModifier("modifier_item_cleaver_cleave") then
		for i=0, 5, 1 do
			local current_item = keys.caster:GetItemInSlot(i)
			if current_item ~= nil then
				if current_item:GetName() == "item_cleaver" then
					keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_cleaver_cleave", {duration = -1})
				end
			end
		end
	end
end


--[[ ============================================================================================================
	Author: Rook
	Date: February 2, 2015
	Called regularly while the caster has at least one cleave modifier from Battle Fury.  If the caster is no longer
	melee (which would be the case on, for example, Troll Warlord), remove the cleave modifiers from the caster.
================================================================================================================= ]]
function modifier_item_cleaver_cleave_on_interval_think(keys)
	if keys.caster:IsRangedAttacker() then
		while keys.caster:HasModifier("modifier_item_cleaver_cleave") do
			keys.caster:RemoveModifierByName("modifier_item_cleaver_cleave")
		end
	end
end

function modifier_item_cleaver_cleave_new(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local cleave_damage_pct = ability:GetLevelSpecialValueFor("cleave_damage_percent", (ability:GetLevel() - 1))
	local cleave_damage = caster:GetAverageTrueAttackDamage(caster) * (cleave_damage_pct / 100)
	local cleave_start = ability:GetLevelSpecialValueFor("cleave_starting_width", (ability:GetLevel() - 1))
	local cleave_end = ability:GetLevelSpecialValueFor("cleave_ending_width", (ability:GetLevel() - 1))
	local cleave_distance = ability:GetLevelSpecialValueFor("cleave_distance", (ability:GetLevel() - 1))
	local cleave_start_act = ability:GetLevelSpecialValueFor("cleave_starting_width_act", (ability:GetLevel() - 1))
	local cleave_end_act = ability:GetLevelSpecialValueFor("cleave_ending_width_act", (ability:GetLevel() - 1))
	local cleave_distance_act = ability:GetLevelSpecialValueFor("cleave_distance_act", (ability:GetLevel() - 1))
	
	if not caster:IsRangedAttacker() then
		if caster:HasModifier("modifier_item_cleaver_active") then
			DoCleaveAttack(caster, target, ability, cleave_damage, cleave_start_act, cleave_end_act, cleave_distance_act, "particles/items_fx/battlefury_cleave.vpcf" )
		else
			DoCleaveAttack(caster, target, ability, cleave_damage, cleave_start, cleave_end, cleave_distance, "particles/items_fx/battlefury_cleave.vpcf" )
		end
	end
end