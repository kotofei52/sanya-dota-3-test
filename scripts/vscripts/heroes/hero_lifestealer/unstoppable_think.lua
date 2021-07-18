function UnstoppableThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local extra_attack_speed = (math.ceil(caster:GetIncreasedAttackSpeed() * 100) - caster:GetAgility())
	local extra_conv = math.floor(extra_attack_speed / 15)
	
	local extra_attack_speed_scepter = math.ceil(caster:GetIncreasedAttackSpeed() * 100)
	local extra_conv_scepter = math.floor(extra_attack_speed_scepter / 15)
	
	if caster:HasScepter() then
		local counter_buff = caster:FindModifierByName("modifier_ls_unstoppable_stack_counter")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_ls_unstoppable_stack_counter", nil)
			counter_buff = caster:FindModifierByName("modifier_ls_unstoppable_stack_counter")
		end

		if counter_buff:GetStackCount() < extra_conv_scepter then
			counter_buff:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_ls_unstoppable_stack", nil)
		elseif counter_buff:GetStackCount() > extra_conv_scepter and caster:HasModifier("modifier_ls_unstoppable_stack") then
			counter_buff:DecrementStackCount()
			caster:FindModifierByName("modifier_ls_unstoppable_stack"):Destroy()
		end
	else
		local counter_buff = caster:FindModifierByName("modifier_ls_unstoppable_stack_counter")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_ls_unstoppable_stack_counter", nil)
			counter_buff = caster:FindModifierByName("modifier_ls_unstoppable_stack_counter")
		end

		if counter_buff:GetStackCount() < extra_conv then
			counter_buff:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_ls_unstoppable_stack", nil)
		elseif counter_buff:GetStackCount() > extra_conv and caster:HasModifier("modifier_ls_unstoppable_stack") then
			counter_buff:DecrementStackCount()
			caster:FindModifierByName("modifier_ls_unstoppable_stack"):Destroy()
		end
	end
end