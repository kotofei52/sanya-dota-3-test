function zombie_check_ranged(keys)
	local caster = keys.caster
	local ability = keys.ability
	local attacker = keys.attacker

	if attacker:IsRangedAttacker() and caster:FindModifierByName("modifier_zombie_range_emitter") == nil then
		ability:ApplyDataDrivenModifier(caster,caster,"modifier_zombie_range_emitter",{})
	end 
end

function zombie_check_ranged_remove(keys)
	local caster = keys.caster
	local ability = keys.ability
	local allies = FindUnitsInRadius(caster:GetTeam(), caster, nil, 1200, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_ALL, 0, 0, false)

	allies:RemoveModifierByName("modifier_zombie_range_emitter")
end