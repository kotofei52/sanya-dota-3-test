function LordThink( keys )
	local caster = keys.caster
	local ability = keys.ability

	if caster:HasScepter() then
		if not caster:HasModifier("modifier_sf_lordly_mr_scepter") then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_sf_lordly_mr_scepter", nil)
		end
	else
		caster:RemoveModifierByName("modifier_sf_lordly_mr_scepter")
	end
end