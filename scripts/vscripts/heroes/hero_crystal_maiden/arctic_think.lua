function ArcticThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local max_hp = caster:GetMaxHealth()
	local max_mana = caster:GetMaxMana()
	local current_hp = caster:GetHealth()
	local current_mana = caster:GetMana()
	local hp_diff = (max_hp - current_hp)
	local mana_diff = (max_mana - current_mana)
	local caster_hp_regen = (caster:GetHealthRegen() * 0.9)
	local caster_mana_regen = (caster:GetManaRegen() * 0.9)
	
	local caster_hp_regen_int, caster_hp_regen_dec = math.modf(caster_hp_regen)
	local caster_mana_regen_int, caster_mana_regen_dec = math.modf(caster_mana_regen)
	
	local caster_hp_regen_big = caster_hp_regen_int
	local caster_hp_regen_small = math.floor(caster_hp_regen_dec * 10)
	
	local caster_mana_regen_big = caster_mana_regen_int
	local caster_mana_regen_small = math.floor(caster_mana_regen_dec * 10)
	
	local caster_hp_regen_scepter = (caster:GetHealthRegen() * 1.8)
	local caster_mana_regen_scepter = (caster:GetManaRegen() * 1.8)
	
	local caster_hp_regen_int_scepter, caster_hp_regen_dec_scepter = math.modf(caster_hp_regen_scepter)
	local caster_mana_regen_int_scepter, caster_mana_regen_dec_scepter = math.modf(caster_mana_regen_scepter)
	
	local caster_hp_regen_big_scepter = caster_hp_regen_int_scepter
	local caster_hp_regen_small_scepter = math.floor(caster_hp_regen_dec_scepter * 10)
	
	local caster_mana_regen_big_scepter = caster_mana_regen_int_scepter
	local caster_mana_regen_small_scepter = math.floor(caster_mana_regen_dec_scepter * 10)
	
	if caster:HasScepter() then
		if hp_diff == 0 and mana_diff == 0 then
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_hp")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_hp_big")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_mana")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_mana_big")
			
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_hp")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_hp_big")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_mana")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_mana_big")
		elseif hp_diff > 0 and mana_diff > 0 then
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_hp")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_hp_big")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_mana")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_mana_big")
			
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_hp")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_hp_big")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_mana")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_mana_big")
		elseif hp_diff > 0 and mana_diff <= 0 then
			local counter_buff = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_hp")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
			if counter_buff == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_counter_hp", nil)
				counter_buff = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_hp")
			end
			local counter_buff_big = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_hp_big")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
			if counter_buff_big == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_counter_hp_big", nil)
				counter_buff_big = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_hp_big")
			end
			
			if counter_buff:GetStackCount() < caster_mana_regen_small_scepter then
				counter_buff:IncrementStackCount()
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_hp", nil)
			elseif counter_buff:GetStackCount() > caster_mana_regen_small_scepter and caster:HasModifier("modifier_cm_arctic_stability_stack_hp") then
				counter_buff:DecrementStackCount()
				caster:FindModifierByName("modifier_cm_arctic_stability_stack_hp"):Destroy()
			end
			
			if counter_buff_big:GetStackCount() < caster_mana_regen_big_scepter then
				counter_buff_big:IncrementStackCount()
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_hp_big", nil)
			elseif counter_buff_big:GetStackCount() > caster_mana_regen_big_scepter and caster:HasModifier("modifier_cm_arctic_stability_stack_hp_big") then
				counter_buff_big:DecrementStackCount()
				caster:FindModifierByName("modifier_cm_arctic_stability_stack_hp_big"):Destroy()
			end
		elseif mana_diff > 0 and hp_diff <= 0 then
			local counter_buff2 = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_mana")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
			if counter_buff2 == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_counter_mana", nil)
				counter_buff2 = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_mana")
			end
			local counter_buff_big2 = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_mana_big")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
			if counter_buff_big2 == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_counter_mana_big", nil)
				counter_buff_big2 = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_mana_big")
			end
			
			if counter_buff2:GetStackCount() < caster_hp_regen_small_scepter then
				counter_buff2:IncrementStackCount()
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_mana", nil)
			elseif counter_buff2:GetStackCount() > caster_hp_regen_small_scepter and caster:HasModifier("modifier_cm_arctic_stability_stack_mana") then
				counter_buff2:DecrementStackCount()
				caster:FindModifierByName("modifier_cm_arctic_stability_stack_mana"):Destroy()
			end
			
			if counter_buff_big2:GetStackCount() < caster_hp_regen_big_scepter then
				counter_buff_big2:IncrementStackCount()
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_mana_big", nil)
			elseif counter_buff_big2:GetStackCount() > caster_hp_regen_big_scepter and caster:HasModifier("modifier_cm_arctic_stability_stack_mana_big") then
				counter_buff_big2:DecrementStackCount()
				caster:FindModifierByName("modifier_cm_arctic_stability_stack_mana_big"):Destroy()
			end
		end
	else
		if hp_diff == 0 and mana_diff == 0 then
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_hp")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_hp_big")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_mana")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_mana_big")
			
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_hp")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_hp_big")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_mana")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_mana_big")
		elseif hp_diff > 0 and mana_diff > 0 then
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_hp")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_hp_big")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_mana")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_counter_mana_big")
			
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_hp")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_hp_big")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_mana")
			caster:RemoveModifierByName("modifier_cm_arctic_stability_stack_mana_big")
		elseif hp_diff > 0 and mana_diff <= 0 then
			local counter_buff = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_hp")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
			if counter_buff == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_counter_hp", nil)
				counter_buff = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_hp")
			end
			local counter_buff_big = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_hp_big")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
			if counter_buff_big == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_counter_hp_big", nil)
				counter_buff_big = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_hp_big")
			end
			
			if counter_buff:GetStackCount() < caster_mana_regen_small then
				counter_buff:IncrementStackCount()
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_hp", nil)
			elseif counter_buff:GetStackCount() > caster_mana_regen_small and caster:HasModifier("modifier_cm_arctic_stability_stack_hp") then
				counter_buff:DecrementStackCount()
				caster:FindModifierByName("modifier_cm_arctic_stability_stack_hp"):Destroy()
			end
			
			if counter_buff_big:GetStackCount() < caster_mana_regen_big then
				counter_buff_big:IncrementStackCount()
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_hp_big", nil)
			elseif counter_buff_big:GetStackCount() > caster_mana_regen_big and caster:HasModifier("modifier_cm_arctic_stability_stack_hp_big") then
				counter_buff_big:DecrementStackCount()
				caster:FindModifierByName("modifier_cm_arctic_stability_stack_hp_big"):Destroy()
			end
		elseif mana_diff > 0 and hp_diff <= 0 then
			local counter_buff2 = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_mana")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
			if counter_buff2 == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_counter_mana", nil)
				counter_buff2 = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_mana")
			end
			local counter_buff_big2 = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_mana_big")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
			if counter_buff_big2 == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_counter_mana_big", nil)
				counter_buff_big2 = caster:FindModifierByName("modifier_cm_arctic_stability_stack_counter_mana_big")
			end
			
			if counter_buff2:GetStackCount() < caster_hp_regen_small then
				counter_buff2:IncrementStackCount()
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_mana", nil)
			elseif counter_buff2:GetStackCount() > caster_hp_regen_small and caster:HasModifier("modifier_cm_arctic_stability_stack_mana") then
				counter_buff2:DecrementStackCount()
				caster:FindModifierByName("modifier_cm_arctic_stability_stack_mana"):Destroy()
			end
			
			if counter_buff_big2:GetStackCount() < caster_hp_regen_big then
				counter_buff_big2:IncrementStackCount()
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_cm_arctic_stability_stack_mana_big", nil)
			elseif counter_buff_big2:GetStackCount() > caster_hp_regen_big and caster:HasModifier("modifier_cm_arctic_stability_stack_mana_big") then
				counter_buff_big2:DecrementStackCount()
				caster:FindModifierByName("modifier_cm_arctic_stability_stack_mana_big"):Destroy()
			end
		end
	end
end
