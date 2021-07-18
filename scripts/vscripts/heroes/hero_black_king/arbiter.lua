function RemoveModifier( keys )
	local target = keys.target
	local modifier = keys.modifier

	target:RemoveModifierByName(modifier)
end

function Increment( keys )
	local caster = keys.caster
	local target = keys.target
	local modifier = keys.modifier

	local current_stack = target:GetModifierStackCount(modifier,caster)

	if current_stack < 1 then
		target:SetModifierStackCount(modifier,caster,1)
	else
		target:SetModifierStackCount(modifier,caster,current_stack + 1)
	end
end