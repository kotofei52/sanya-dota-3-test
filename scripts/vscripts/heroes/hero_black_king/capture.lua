function modifier_capture_lifesteal(keys)
	if keys.target.GetInvulnCount == nil then
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.attacker, "modifier_capture_ls", {duration = 0.03})
	end
end

function modifier_capture_lifesteal_passive(keys)
	if keys.target.GetInvulnCount == nil then
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.attacker, "modifier_capture_ls_passive", {duration = 0.03})
	end
end

function Increment( keys )
	local caster = keys.caster
	local modifier = keys.modifier
	local max_stacks = keys.max_stacks

	local current_stack = caster:GetModifierStackCount(modifier,caster)

	if current_stack < 1 then
		caster:SetModifierStackCount(modifier,caster,1)
	elseif current_stack > (max_stacks - 1) then
		caster:SetModifierStackCount(modifier,caster,max_stacks)
	else
		caster:SetModifierStackCount(modifier,caster,current_stack + 1)
	end
end

function Increment_decrease( keys )
	local caster = keys.caster
	local modifier = keys.modifier

	local current_stack = caster:GetModifierStackCount(modifier,caster)
	
	if keys.target.GetInvulnCount == nil and not keys.target:IsBuilding() then
		if current_stack < 1 then
			caster:SetModifierStackCount(modifier,caster,0)
			caster:RemoveModifierByName("modifier_capture_ls_buff")
			caster:RemoveModifierByName("modifier_capture_crit")
			keys.ability:ToggleAbility()
		else
			caster:SetModifierStackCount(modifier,caster,current_stack - 1)
		end
	end
end

function Increment_hero( keys )
	local caster = keys.caster
	local modifier = keys.modifier
	local max_stacks = keys.max_stacks

	local current_stack = caster:GetModifierStackCount(modifier,caster)

	if current_stack > (max_stacks - 5) then
		caster:SetModifierStackCount(modifier,caster,max_stacks)
	else
		caster:SetModifierStackCount(modifier,caster,current_stack + 4)
	end
end

function stack_check( keys )
	local caster = keys.caster
	local modifier = keys.modifier

	local current_stack = caster:GetModifierStackCount(modifier,caster)
	
	if keys.target.GetInvulnCount == nil and not keys.target:IsBuilding() then
		if current_stack < 1 then
			caster:RemoveModifierByName("modifier_capture_ls_buff")
			caster:RemoveModifierByName("modifier_capture_crit")
			keys.ability:ToggleAbility()
		end
	end
end

function Add_buff(keys)
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	
	local current_stack = caster:GetModifierStackCount(modifier,caster)
	local total_duration = (2 + current_stack)
	
	ability:ApplyDataDrivenModifier(caster, caster, "modifier_capture_crit", {duration = total_duration})
	ability:ApplyDataDrivenModifier(caster, caster, "modifier_capture_ls_buff", {duration = total_duration})
	caster:SetModifierStackCount(modifier,caster,0)
end