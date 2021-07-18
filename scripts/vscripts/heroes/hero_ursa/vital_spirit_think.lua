function VitalThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local creepDuration = ability:GetLevelSpecialValueFor( "duration_creep" , ability:GetLevel() - 1  )

	if caster:HasScepter() then
		caster:RemoveModifierByName("modifier_vital_creep")
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_vital_creep_scepter", { duration = creepDuration })
	else
		caster:RemoveModifierByName("modifier_vital_creep_scepter")
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_vital_creep", { duration = creepDuration })
	end
end

function VitalThinkHero( keys )
	local caster = keys.caster
	local ability = keys.ability
	local heroDuration = ability:GetLevelSpecialValueFor( "duration_hero" , ability:GetLevel() - 1  )

	if caster:HasScepter() then
		caster:RemoveModifierByName("modifier_vital_hero")
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_vital_hero_scepter", { duration = heroDuration })
	else
		caster:RemoveModifierByName("modifier_vital_hero_scepter")
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_vital_hero", { duration = heroDuration })
	end
end