function StrikeThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local health_missing = caster:GetHealthDeficit()
	local health_perc = caster:GetHealthPercent()

	if keys.caster:HasScepter() then
		if (health_perc < 50) then
			caster:RemoveModifierByName("modifier_pa_first_to_strike_buff")
		else
			if not caster:HasModifier("modifier_pa_first_to_strike_buff") then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_pa_first_to_strike_buff", {})
			else return 1 end
		end
	else
		if (health_missing > 0) then
			caster:RemoveModifierByName("modifier_pa_first_to_strike_buff")
		else
			if not caster:HasModifier("modifier_pa_first_to_strike_buff") then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_pa_first_to_strike_buff", {})
			else return 1 end
		end
	end
end