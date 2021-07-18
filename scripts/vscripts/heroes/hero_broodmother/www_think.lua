function WebThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	
	if caster:HasScepter() then
		if caster:HasModifier("modifier_broodmother_spin_web") then
			caster:RemoveModifierByName("modifier_www_out")
			
			if not caster:HasModifier("modifier_www_in_scepter") then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_www_in_scepter", nil)
			end
		else
			caster:RemoveModifierByName("modifier_www_in_scepter")
			
			if not caster:HasModifier("modifier_www_out") then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_www_out", nil)
			end
		end
	else
		caster:RemoveModifierByName("modifier_www_in_scepter")

		if caster:HasModifier("modifier_broodmother_spin_web") then
			caster:RemoveModifierByName("modifier_www_out")
		else
			if not caster:HasModifier("modifier_www_out") then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_www_out", nil)
			end
		end
	end
end