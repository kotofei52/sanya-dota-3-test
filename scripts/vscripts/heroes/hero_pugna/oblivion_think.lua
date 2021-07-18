function OblivionThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local caster_int = math.floor(caster:GetIntellect() )
	
	local counter_buff = caster:FindModifierByName("modifier_pugna_oblivion_stack_counter")
	-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
	if counter_buff == nil then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_pugna_oblivion_stack_counter", nil)
		counter_buff = caster:FindModifierByName("modifier_pugna_oblivion_stack_counter")
	end

	if counter_buff:GetStackCount() < caster_int then
		counter_buff:IncrementStackCount()
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_pugna_oblivion_stack", nil)
	elseif counter_buff:GetStackCount() > caster_int and caster:HasModifier("modifier_pugna_oblivion_stack") then
		counter_buff:DecrementStackCount()
		caster:FindModifierByName("modifier_pugna_oblivion_stack"):Destroy()
	end
	
	if caster:HasScepter() then
		local counter_buff2 = caster:FindModifierByName("modifier_pugna_oblivion_stack_counter_scepter")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff2 variable so it's no longer nil.
		if counter_buff2 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_pugna_oblivion_stack_counter_scepter", nil)
			counter_buff2 = caster:FindModifierByName("modifier_pugna_oblivion_stack_counter_scepter")
		end

		if counter_buff2:GetStackCount() < caster_int then
			counter_buff2:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_pugna_oblivion_stack_scepter", nil)
		elseif counter_buff2:GetStackCount() > caster_int and caster:HasModifier("modifier_pugna_oblivion_stack_scepter") then
			counter_buff2:DecrementStackCount()
			caster:FindModifierByName("modifier_pugna_oblivion_stack_scepter"):Destroy()
		end
	else
		local counter_buff2 = caster:FindModifierByName("modifier_pugna_oblivion_stack_counter_scepter")
		
		if caster:HasModifier("modifier_pugna_oblivion_stack_scepter") then
			counter_buff2:DecrementStackCount()
			caster:FindModifierByName("modifier_pugna_oblivion_stack_scepter"):Destroy()
		end
	end
end