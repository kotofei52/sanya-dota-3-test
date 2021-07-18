function PreThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local health_perc = caster:GetHealthPercent()
	local missing_perc = (100 - math.ceil(health_perc) )
	
	if caster:HasScepter() then
		local counter_buff = caster:FindModifierByName("modifier_oracle_premonition_stack_counter")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_oracle_premonition_stack_counter", nil)
			counter_buff = caster:FindModifierByName("modifier_oracle_premonition_stack_counter")
		end

		if counter_buff:GetStackCount() < missing_perc then
			counter_buff:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_oracle_premonition_stack", nil)
		elseif counter_buff:GetStackCount() > missing_perc and caster:HasModifier("modifier_oracle_premonition_stack") then
			counter_buff:DecrementStackCount()
			caster:FindModifierByName("modifier_oracle_premonition_stack"):Destroy()
		end
	else
		local counter_buff = caster:FindModifierByName("modifier_oracle_premonition_stack_counter")
		
		if caster:HasModifier("modifier_oracle_premonition_stack") then
			counter_buff:DecrementStackCount()
			caster:FindModifierByName("modifier_oracle_premonition_stack"):Destroy()
		end
	end
end