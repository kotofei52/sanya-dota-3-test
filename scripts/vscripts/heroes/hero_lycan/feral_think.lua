function FeralThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local caster_agi = caster:GetAgility()
	local caster_agi_double = (caster_agi * 2)
	local caster_armor = ability:GetLevelSpecialValueFor("bonus_armor", (ability:GetLevel() - 1))
	
	local caster_str = caster:GetStrength()
	local caster_str_double = (caster_str * 2)
	
	caster:SetPhysicalArmorBaseValue(caster_agi * caster_armor)
	
	local counter_buff = caster:FindModifierByName("modifier_lycan_feral_stack_counter")
	-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
	if counter_buff == nil then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_lycan_feral_stack_counter", nil)
		counter_buff = caster:FindModifierByName("modifier_lycan_feral_stack_counter")
	end
	
	if caster:HasModifier("modifier_lycan_shapeshift") then
		if counter_buff:GetStackCount() < caster_agi_double then
			counter_buff:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_lycan_feral_stack", nil)
		elseif counter_buff:GetStackCount() > caster_agi_double and caster:HasModifier("modifier_lycan_feral_stack") then
			counter_buff:DecrementStackCount()
			caster:FindModifierByName("modifier_lycan_feral_stack"):Destroy()
		end
	else
		if counter_buff:GetStackCount() < caster_agi then
			counter_buff:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_lycan_feral_stack", nil)
		elseif counter_buff:GetStackCount() > caster_agi and caster:HasModifier("modifier_lycan_feral_stack") then
			counter_buff:DecrementStackCount()
			caster:FindModifierByName("modifier_lycan_feral_stack"):Destroy()
		end
	end
	
	if caster:HasScepter() then
		local counter_buff2 = caster:FindModifierByName("modifier_lycan_feral_stack_counter_scepter")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff2 variable so it's no longer nil.
		if counter_buff2 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_lycan_feral_stack_counter_scepter", nil)
			counter_buff2 = caster:FindModifierByName("modifier_lycan_feral_stack_counter_scepter")
		end
		
		if caster:HasModifier("modifier_lycan_shapeshift") then
			if counter_buff2:GetStackCount() < caster_str_double then
				counter_buff2:IncrementStackCount()
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_lycan_feral_stack_scepter", nil)
			elseif counter_buff2:GetStackCount() > caster_str_double and caster:HasModifier("modifier_lycan_feral_stack_scepter") then
				counter_buff2:DecrementStackCount()
				caster:FindModifierByName("modifier_lycan_feral_stack_scepter"):Destroy()
			end
		else
			if counter_buff2:GetStackCount() < caster_str then
				counter_buff2:IncrementStackCount()
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_lycan_feral_stack_scepter", nil)
			elseif counter_buff2:GetStackCount() > caster_str and caster:HasModifier("modifier_lycan_feral_stack_scepter") then
				counter_buff2:DecrementStackCount()
				caster:FindModifierByName("modifier_lycan_feral_stack_scepter"):Destroy()
			end
		end
	else
		local counter_buff2 = caster:FindModifierByName("modifier_lycan_feral_stack_counter_scepter")
		
		if caster:HasModifier("modifier_lycan_feral_stack_scepter") then
			counter_buff2:DecrementStackCount()
			caster:FindModifierByName("modifier_lycan_feral_stack_scepter"):Destroy()
		end
	end
end