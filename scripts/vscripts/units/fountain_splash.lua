function Splash( keys )
	-- Variables
	local modifierName = "modifier_fury_swipes_target_datadriven"
	local fury_ability = keys.caster:FindAbilityByName("fountain_fury_swipes")
	
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local radius_small = ability:GetLevelSpecialValueFor("splash_radius", 0) + (target:GetModifierStackCount(modifierName, fury_ability)) * 15
	local radius_medium = ability:GetLevelSpecialValueFor("splash_radius", 1) + (target:GetModifierStackCount(modifierName, fury_ability)) * 15
	local radius_big = ability:GetLevelSpecialValueFor("splash_radius", 2) + (target:GetModifierStackCount(modifierName, fury_ability)) * 15
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
	
	-- Fury Swipes damage table
	local damage_table_bonus = {}
	damage_table_bonus.attacker = caster
	damage_table_bonus.damage_type = DAMAGE_TYPE_PURE
	damage_table_bonus.damage = (target:GetModifierStackCount(modifierName, fury_ability)) * 5


	--loop for doing the splash damage while ignoring the original target
	for i,v in ipairs(splash_radius_small) do
		if v ~= target then 
			damage_table.victim = v
			ApplyDamage(damage_table)
			damage_table_bonus.victim = v
			ApplyDamage(damage_table_bonus)
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
				damage_table_bonus.victim = v
				ApplyDamage(damage_table_bonus)
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
				damage_table_bonus.victim = v
				ApplyDamage(damage_table_bonus)
			else
				target_exists = false
			end
		end
	end
end