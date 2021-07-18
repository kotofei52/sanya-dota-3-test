function Increment( keys )
	local caster = keys.caster
	local modifier = keys.modifier

	local current_stack = caster:GetModifierStackCount(modifier,caster)

	if current_stack < 1 then
		caster:SetModifierStackCount(modifier,caster,1)
	else
		caster:SetModifierStackCount(modifier,caster,current_stack + 1)
	end
end