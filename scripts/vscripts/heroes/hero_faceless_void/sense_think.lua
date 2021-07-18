function SenseThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local current_day = caster:GetDayTimeVisionRange()
	local current_night = caster:GetNightTimeVisionRange()
	
	if caster:HasScepter() then
		caster:RemoveModifierByName("modifier_fv_sense_night")
		
		if not caster:HasModifier("modifier_fv_sense_night_scepter") then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_fv_sense_night_scepter", {})
		end
	else
		caster:RemoveModifierByName("modifier_fv_sense_night_scepter")
		
		if not caster:HasModifier("modifier_fv_sense_night") then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_fv_sense_night", {})
		end
	end
	
	if caster:HasModifier("modifier_spectre_desolate_blind") then
		if caster:HasScepter() then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_fv_sense_spectre_bonus_scepter", {})
		else
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_fv_sense_spectre_bonus", {})
		end
	end
end