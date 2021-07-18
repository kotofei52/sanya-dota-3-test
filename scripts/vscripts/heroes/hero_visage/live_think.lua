function LiveDeath( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local modifier3 = keys.modifier3

	local current_stack1 = caster:GetModifierStackCount(modifier,caster)
	local current_stack3 = caster:GetModifierStackCount(modifier3,caster)

	if current_stack1 < 1 then
		ability:ApplyDataDrivenModifier(caster, caster, modifier, {})
		caster:SetModifierStackCount(modifier,caster,1)
	else
		caster:SetModifierStackCount(modifier,caster,current_stack1 + 1)
	end
	
	if caster:HasScepter() then
		if current_stack3 < 1 then
			ability:ApplyDataDrivenModifier(caster, caster, modifier3, {})
			caster:SetModifierStackCount(modifier3,caster,1)
		else
			caster:SetModifierStackCount(modifier3,caster,current_stack3 + 1)
		end
	end
end

function LiveKill( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local modifier3 = keys.modifier3

	local current_stack2 = caster:GetModifierStackCount(modifier,caster)
	local current_stack3 = caster:GetModifierStackCount(modifier3,caster)

	if current_stack2 < 1 then
		ability:ApplyDataDrivenModifier(caster, caster, modifier, {})
		caster:SetModifierStackCount(modifier,caster,1)
	else
		caster:SetModifierStackCount(modifier,caster,current_stack2 + 1)
	end
	
	if caster:HasScepter() then
		if current_stack3 < 1 then
			ability:ApplyDataDrivenModifier(caster, caster, modifier3, {})
			caster:SetModifierStackCount(modifier3,caster,1)
		else
			caster:SetModifierStackCount(modifier3,caster,current_stack3 + 1)
		end
	end
end