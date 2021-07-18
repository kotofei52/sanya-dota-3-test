function Increment( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local modifier2 = keys.modifier2

	local current_stack = caster:GetModifierStackCount(modifier,caster)
	local current_stack2 = caster:GetModifierStackCount(modifier2,caster)

	if current_stack < 1 then
		ability:ApplyDataDrivenModifier(caster, caster, modifier, {})
		caster:SetModifierStackCount(modifier,caster,1)
	else
		caster:SetModifierStackCount(modifier,caster,current_stack + 1)
	end
	
	if caster:HasScepter() then
		if current_stack2 < 1 then
			ability:ApplyDataDrivenModifier(caster, caster, modifier2, {})
			caster:SetModifierStackCount(modifier2,caster,1)
		else
			caster:SetModifierStackCount(modifier2,caster,current_stack2 + 1)
		end
	end
end