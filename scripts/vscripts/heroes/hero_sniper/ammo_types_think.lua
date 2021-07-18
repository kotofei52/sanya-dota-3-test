--[[Handling the stacking of Linas Fiery Soul ability
	Author: Pizzalol
	Date: 30.12.2014.]]
function AddStacks( keys )
	local target = keys.target
	local ability = keys.ability
	local maxStack = ability:GetLevelSpecialValueFor("stack_limit", (ability:GetLevel() - 1))
	local modifierCount = target:GetModifierCount()
	local currentStack = 0
	local modifierBuffName = "modifier_item_sure_shot_pierce_debuff"
	local modifierStackName = "modifier_item_sure_shot_pierce_stack_debuff"
	local modifierName
	
	if keys.target:IsBuilding() or keys.caster:IsIllusion() or keys.target:IsMagicImmune() then return 1
	else
		-- Always remove the stack modifier
		target:RemoveModifierByName(modifierStackName) 

		-- Counts the current stacks
		for i = 0, modifierCount do
			modifierName = target:GetModifierNameByIndex(i)

			if modifierName == modifierBuffName then
				currentStack = currentStack + 1
			end
		end

		-- Remove all the old buff modifiers
		for i = 0, currentStack do
			print("Removing modifiers")
			target:RemoveModifierByName(modifierBuffName)
		end

		-- Always apply the stack modifier 
		ability:ApplyDataDrivenModifier(target, target, modifierStackName, {})

		-- Reapply the maximum number of stacks
		if currentStack >= maxStack then
			target:SetModifierStackCount(modifierStackName, ability, maxStack)

			-- Apply the new refreshed stack
			for i = 1, maxStack do
				ability:ApplyDataDrivenModifier(target, target, modifierBuffName, {})
			end
		else
			-- Increase the number of stacks
			currentStack = currentStack + 1

			target:SetModifierStackCount(modifierStackName, ability, currentStack)

			-- Apply the new increased stack
			for i = 1, currentStack do
				ability:ApplyDataDrivenModifier(target, target, modifierBuffName, {})
			end
		end
	end
end

function AddStacksMany( keys )
	local target = keys.target
	local ability = keys.ability
	local maxStack = ability:GetLevelSpecialValueFor("stack_limit", (ability:GetLevel() - 1))
	local addStack = ability:GetLevelSpecialValueFor("bonus_stack", (ability:GetLevel() - 1))
	local modifierCount = target:GetModifierCount()
	local currentStack = 0
	local modifierBuffName = "modifier_item_sure_shot_pierce_debuff"
	local modifierStackName = "modifier_item_sure_shot_pierce_stack_debuff"
	local modifierName

	if keys.target:IsBuilding() or keys.caster:IsIllusion() or keys.target:IsMagicImmune() then return 1
	else
		-- Always remove the stack modifier
		target:RemoveModifierByName(modifierStackName) 

		-- Counts the current stacks
		for i = 0, modifierCount do
			modifierName = target:GetModifierNameByIndex(i)

			if modifierName == modifierBuffName then
				currentStack = currentStack + 1
			end
		end

		-- Remove all the old buff modifiers
		for i = 0, currentStack do
			print("Removing modifiers")
			target:RemoveModifierByName(modifierBuffName)
		end

		-- Always apply the stack modifier 
		ability:ApplyDataDrivenModifier(target, target, modifierStackName, {})

		-- Reapply the maximum number of stacks
		if currentStack >= maxStack then
			target:SetModifierStackCount(modifierStackName, ability, maxStack)

			-- Apply the new refreshed stack
			for i = 1, maxStack do
				ability:ApplyDataDrivenModifier(target, target, modifierBuffName, {})
			end
		else
			-- Increase the number of stacks
			currentStack = currentStack + addStack

			target:SetModifierStackCount(modifierStackName, ability, currentStack)

			-- Apply the new increased stack
			for i = 1, currentStack do
				ability:ApplyDataDrivenModifier(target, target, modifierBuffName, {})
			end
		end
	end
end

function Splash( keys )
	-- Variables
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local radius_small = ability:GetLevelSpecialValueFor("splash_radius", 0)
	local radius_medium = ability:GetLevelSpecialValueFor("splash_radius", 1) 
	local radius_big = ability:GetLevelSpecialValueFor("splash_radius", 2) 
	local target_exists = false
	local splash_damage_small = ability:GetLevelSpecialValueFor("splash_damage_percent", 0) / 100
	local splash_damage_medium = ability:GetLevelSpecialValueFor("splash_damage_percent", 1) / 100
	local splash_damage_big = ability:GetLevelSpecialValueFor("splash_damage_percent", 2) / 100
	
	-- Finding the units for each radius
	local splash_radius_small = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin() , nil, radius_small , DOTA_UNIT_TARGET_TEAM_ENEMY	, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false) 
	local splash_radius_medium = FindUnitsInRadius(caster:GetTeam() , target:GetAbsOrigin() , nil, radius_medium, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
	local splash_radius_big = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin() , nil, radius_big, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	-- Initializing the damage table
	local damage_table = {}
	damage_table.attacker = caster
	damage_table.damage_type = DAMAGE_TYPE_PHYSICAL
	damage_table.damage = caster:GetAverageTrueAttackDamage(caster) * splash_damage_small


	--loop for doing the splash damage while ignoring the original target
	for i,v in ipairs(splash_radius_small) do
		if v ~= target then 
			damage_table.victim = v
			ApplyDamage(damage_table)
		end
	end
	--loop for doing the medium splash damage
	for i,v in ipairs(splash_radius_medium) do
		if v ~= target then
			--loop for checking if the found target is in the splash_radius_small
			for c,k in ipairs(splash_radius_small) do
				if v == k then
					target_exists = true
					break
				end
			end
			--if the target isn't in the splash_radius_small then do attack damage * splash_damage_medium
			if not target_exists then
				damage_table.damage = caster:GetAverageTrueAttackDamage(caster) * splash_damage_medium
				damage_table.victim = v
				ApplyDamage(damage_table)
			--resets the target check	
			else
				target_exists = false
			end
		end
	end
	--loop for doing the damage if targets are found in the splash_damage_big but not in the splash_damage_medium
	for i,v in ipairs(splash_radius_big) do
		if v ~= target then
			--loop for checking if the found target is in the splash_radius_medium
			for c,k in ipairs(splash_radius_medium) do				
				if v == k then
					target_exists = true
					break
				end
			end
			if not target_exists then
				damage_table.damage = caster:GetAverageTrueAttackDamage(caster) * splash_damage_big
				damage_table.victim = v
				ApplyDamage(damage_table)
			else
				target_exists = false
			end
		end
	end
end

function AmmoTypes_toggleoff(keys)
	local ability = keys.ability
	local caster= keys.caster
	
	if caster:HasScepter() then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_sure_shot_pierce", {})
	else
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_sure_shot_siege_slow", {})
	end
end