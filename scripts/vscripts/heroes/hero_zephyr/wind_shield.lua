function Return( event )
	-- Variables
	local caster = event.caster
	local attacker = event.attacker
	local ability = event.ability
	local damage = ability:GetLevelSpecialValueFor( "proc_damage" , ability:GetLevel() - 1  )
	local disarmDuration = ability:GetLevelSpecialValueFor( "hero_duration" , ability:GetLevel() - 1  )
	local damageType = ability:GetAbilityDamageType()

	-- Damage
	if attacker:IsBuilding() or caster:IsIllusion() or attacker:IsMagicImmune() then ability:ApplyDataDrivenModifier(caster, caster, event.modifier_bonus, { duration = disarmDuration } )
		else
		if attacker:GetTeamNumber() ~= caster:GetTeamNumber() then
			ApplyDamage({ victim = attacker, attacker = caster, damage = damage, damage_type = damageType })
			ability:ApplyDataDrivenModifier(caster, attacker, event.modifier_disarm, { duration = disarmDuration } )
			ability:ApplyDataDrivenModifier(caster, caster, event.modifier_bonus, { duration = disarmDuration } )
		end
	end
end