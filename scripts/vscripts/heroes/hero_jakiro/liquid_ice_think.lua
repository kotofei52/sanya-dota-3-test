function IceThink( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local modifier = keys.modifier
	local modifier2 = keys.modifier2

	if caster:HasScepter() then
		ability:ApplyDataDrivenModifier(caster, target, modifier2, {})
	else
		ability:ApplyDataDrivenModifier(caster, target, modifier, {})
	end
end