function FateThink( keys )
	local caster = keys.caster
	local ability = keys.ability

	if caster:HasScepter() then
		if caster:IsStunned() or caster:IsHexed() then
			if not caster:HasModifier("modifier_fate_break") then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_fate_break", nil)
			end
		else
			caster:RemoveModifierByName("modifier_fate_break")
		end
	else
		if caster:IsStunned() then
			if not caster:HasModifier("modifier_fate_break") then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_fate_break", nil)
			end
		else
			caster:RemoveModifierByName("modifier_fate_break")
		end
	end
end