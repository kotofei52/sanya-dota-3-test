function ManaThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local max_mana = caster:GetMaxMana()
	
	local caster_str = caster:GetStrength()
	local caster_agi = caster:GetAgility()

	if (max_mana > 0) then
		caster:SetMana(0)
	end
	
	if keys.caster:HasScepter() then
		local counter_buff = caster:FindModifierByName("modifier_am_purity_of_will_stack_counter")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_am_purity_of_will_stack_counter", nil)
			counter_buff = caster:FindModifierByName("modifier_am_purity_of_will_stack_counter")
		end

		if counter_buff:GetStackCount() < caster_str then
			counter_buff:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_am_purity_of_will_stack", nil)
		elseif counter_buff:GetStackCount() > caster_str and caster:HasModifier("modifier_am_purity_of_will_stack") then
			counter_buff:DecrementStackCount()
			caster:FindModifierByName("modifier_am_purity_of_will_stack"):Destroy()
		end
		
		local counter_buff2 = caster:FindModifierByName("modifier_am_purity_of_will_stack_counter2")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff2 variable so it's no longer nil.
		if counter_buff2 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_am_purity_of_will_stack_counter2", nil)
			counter_buff2 = caster:FindModifierByName("modifier_am_purity_of_will_stack_counter2")
		end

		if counter_buff2:GetStackCount() < caster_agi then
			counter_buff2:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_am_purity_of_will_stack2", nil)
		elseif counter_buff2:GetStackCount() > caster_agi and caster:HasModifier("modifier_am_purity_of_will_stack2") then
			counter_buff2:DecrementStackCount()
			caster:FindModifierByName("modifier_am_purity_of_will_stack2"):Destroy()
		end
	else
		local counter_buff = caster:FindModifierByName("modifier_am_purity_of_will_stack_counter")
		
		if caster:HasModifier("modifier_am_purity_of_will_stack") then
			counter_buff:DecrementStackCount()
			caster:FindModifierByName("modifier_am_purity_of_will_stack"):Destroy()
		end
		
		local counter_buff2 = caster:FindModifierByName("modifier_am_purity_of_will_stack_counter2")
		
		if caster:HasModifier("modifier_am_purity_of_will_stack2") then
			counter_buff2:DecrementStackCount()
			caster:FindModifierByName("modifier_am_purity_of_will_stack2"):Destroy()
		end
	end
end