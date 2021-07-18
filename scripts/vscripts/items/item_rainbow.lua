function item_check_primary_remove(keys)
	local caster = keys.caster
	local ability = keys.ability
	local counter_buff1 = caster:FindModifierByName("modifier_item_rainbow_str_stack_counter")
	local counter_buff2 = caster:FindModifierByName("modifier_item_rainbow_agi_stack_counter")
	local counter_buff3 = caster:FindModifierByName("modifier_item_rainbow_int_stack_counter")
	
	if caster:GetPrimaryAttribute() == 0 and counter_buff1:GetStackCount() > 0 then
		counter_buff1:DecrementStackCount()
		caster:FindModifierByName("modifier_item_rainbow_str_stack"):Destroy()
	end
	
	if caster:GetPrimaryAttribute() == 1 and counter_buff2:GetStackCount() > 0 then
		counter_buff2:DecrementStackCount()
		caster:FindModifierByName("modifier_item_rainbow_agi_stack"):Destroy()
	end
	
	if caster:GetPrimaryAttribute() == 2 and counter_buff3:GetStackCount() > 0 then
		counter_buff3:DecrementStackCount()
		caster:FindModifierByName("modifier_item_rainbow_int_stack"):Destroy()
	end
end

function item_check_primary(keys)
	local caster = keys.caster
	local ability = keys.ability

	--0 = strength, 1 = agility, 2 = intelligence
	if caster:GetPrimaryAttribute() == 0 then
		local caster_str = math.floor(caster:GetStrength() )
		
		local counter_buff1 = caster:FindModifierByName("modifier_item_rainbow_str_stack_counter")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff1 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_item_rainbow_str_stack_counter", nil)
			counter_buff1 = caster:FindModifierByName("modifier_item_rainbow_str_stack_counter")
		end

		if counter_buff1:GetStackCount() < caster_str then
			counter_buff1:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_item_rainbow_str_stack", nil)
		elseif counter_buff1:GetStackCount() > caster_str and caster:HasModifier("modifier_item_rainbow_str_stack") then
			counter_buff1:DecrementStackCount()
			caster:FindModifierByName("modifier_item_rainbow_str_stack"):Destroy()
		end
	elseif caster:GetPrimaryAttribute() == 1 then
		local caster_agi = math.floor(caster:GetAgility() )
		
		local counter_buff2 = caster:FindModifierByName("modifier_item_rainbow_agi_stack_counter")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff2 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_item_rainbow_agi_stack_counter", nil)
			counter_buff2 = caster:FindModifierByName("modifier_item_rainbow_agi_stack_counter")
		end

		if counter_buff2:GetStackCount() < caster_agi then
			counter_buff2:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_item_rainbow_agi_stack", nil)
		elseif counter_buff2:GetStackCount() > caster_agi and caster:HasModifier("modifier_item_rainbow_agi_stack") then
			counter_buff2:DecrementStackCount()
			caster:FindModifierByName("modifier_item_rainbow_agi_stack"):Destroy()
		end
	elseif caster:GetPrimaryAttribute() == 2 then
		local caster_int = math.floor(caster:GetIntellect() )
		
		local counter_buff3 = caster:FindModifierByName("modifier_item_rainbow_int_stack_counter")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff3 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_item_rainbow_int_stack_counter", nil)
			counter_buff3 = caster:FindModifierByName("modifier_item_rainbow_int_stack_counter")
		end

		if counter_buff3:GetStackCount() < caster_int then
			counter_buff3:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_item_rainbow_int_stack", nil)
		elseif counter_buff3:GetStackCount() > caster_int and caster:HasModifier("modifier_item_rainbow_int_stack") then
			counter_buff3:DecrementStackCount()
			caster:FindModifierByName("modifier_item_rainbow_int_stack"):Destroy()
		end
	end 
end