function scepter_check( keys )
local caster = keys.caster
local scepter = caster:HasScepter()
local ability = keys.ability

	if scepter then
		local modifier_scepter = keys.modifier_scepter
		ability:ApplyDataDrivenModifier(caster, caster, modifier_scepter, {})
	end
end