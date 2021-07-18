function PossessionThink(keys)
	local caster = keys.caster
	local ability = keys.ability
	local radius = ability:GetLevelSpecialValueFor( "aoe_radius", ability:GetLevel() - 1 )
	local targetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY
	local targetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
	local targetFlag = DOTA_UNIT_TARGET_FLAG_NONE
	
	local units = FindUnitsInRadius(
		caster:GetTeamNumber(), caster:GetAbsOrigin(), caster, radius, targetTeam,
		targetType, targetFlag, FIND_ANY_ORDER, false
	)
	
	if next(units) == nil then
		caster:RemoveModifierByName("modifier_spectre_possession_buff_scepter")
		caster:RemoveModifierByName("modifier_spectre_possession_buff")
	else
		if caster:HasScepter() then
			caster:RemoveModifierByName("modifier_spectre_possession_buff")
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_spectre_possession_buff_scepter", nil)
		else
			caster:RemoveModifierByName("modifier_spectre_possession_buff_scepter")
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_spectre_possession_buff", nil)
		end
	end
end