function SpiritThink( keys )
	local caster = keys.caster
	local ability = keys.ability

	if caster:HasScepter() then
		caster:RemoveModifierByName("modifier_spirit_amp")
		
		if not caster:HasModifier("modifier_spirit_amp_scepter") then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_spirit_amp_scepter", nil)
		end
		
		if not caster:HasModifier("modifier_spirit_amp_creep_scepter") then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_spirit_amp_creep_scepter", nil)
		end
	else
		caster:RemoveModifierByName("modifier_spirit_amp_scepter")
		caster:RemoveModifierByName("modifier_spirit_amp_creep_scepter")
		
		if not caster:HasModifier("modifier_spirit_amp") then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_spirit_amp", nil)
		end
	end
end