function ExtraThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local caster_str = math.floor(caster:GetStrength() / 3)
	local caster_agi = math.floor(caster:GetAgility() )
	local caster_int = math.floor(caster:GetIntellect() )
	
	local caster_str_scepter = math.floor(caster:GetStrength() / 3 * 1.5)
	local caster_agi_scepter = math.floor(caster:GetAgility() * 1.5)
	local caster_int_scepter = math.floor(caster:GetIntellect() * 1.5)
	
	if caster:HasScepter() then
		local counter_buff1 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_str")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff1 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_counter_str", nil)
			counter_buff1 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_str")
		end

		if counter_buff1:GetStackCount() < caster_str_scepter then
			counter_buff1:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_str", nil)
		elseif counter_buff1:GetStackCount() > caster_str_scepter and caster:HasModifier("modifier_gyro_extra_stack_str") then
			counter_buff1:DecrementStackCount()
			caster:FindModifierByName("modifier_gyro_extra_stack_str"):Destroy()
		end
		
		local counter_buff2 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_agi")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff2 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_counter_agi", nil)
			counter_buff2 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_agi")
		end

		if counter_buff2:GetStackCount() < caster_agi_scepter then
			counter_buff2:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_agi", nil)
		elseif counter_buff2:GetStackCount() > caster_agi_scepter and caster:HasModifier("modifier_gyro_extra_stack_agi") then
			counter_buff2:DecrementStackCount()
			caster:FindModifierByName("modifier_gyro_extra_stack_agi"):Destroy()
		end
		
		local counter_buff3 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_int")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff3 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_counter_int", nil)
			counter_buff3 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_int")
		end

		if counter_buff3:GetStackCount() < caster_int_scepter then
			counter_buff3:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_int", nil)
		elseif counter_buff3:GetStackCount() > caster_int_scepter and caster:HasModifier("modifier_gyro_extra_stack_int") then
			counter_buff3:DecrementStackCount()
			caster:FindModifierByName("modifier_gyro_extra_stack_int"):Destroy()
		end
	else
		local counter_buff1 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_str")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff1 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_counter_str", nil)
			counter_buff1 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_str")
		end

		if counter_buff1:GetStackCount() < caster_str then
			counter_buff1:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_str", nil)
		elseif counter_buff1:GetStackCount() > caster_str and caster:HasModifier("modifier_gyro_extra_stack_str") then
			counter_buff1:DecrementStackCount()
			caster:FindModifierByName("modifier_gyro_extra_stack_str"):Destroy()
		end
		
		local counter_buff2 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_agi")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff2 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_counter_agi", nil)
			counter_buff2 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_agi")
		end

		if counter_buff2:GetStackCount() < caster_agi then
			counter_buff2:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_agi", nil)
		elseif counter_buff2:GetStackCount() > caster_agi and caster:HasModifier("modifier_gyro_extra_stack_agi") then
			counter_buff2:DecrementStackCount()
			caster:FindModifierByName("modifier_gyro_extra_stack_agi"):Destroy()
		end
		
		local counter_buff3 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_int")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff3 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_counter_int", nil)
			counter_buff3 = caster:FindModifierByName("modifier_gyro_extra_stack_counter_int")
		end

		if counter_buff3:GetStackCount() < caster_int then
			counter_buff3:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_gyro_extra_stack_int", nil)
		elseif counter_buff3:GetStackCount() > caster_int and caster:HasModifier("modifier_gyro_extra_stack_int") then
			counter_buff3:DecrementStackCount()
			caster:FindModifierByName("modifier_gyro_extra_stack_int"):Destroy()
		end
	end
end