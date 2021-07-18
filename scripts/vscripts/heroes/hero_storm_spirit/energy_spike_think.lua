function SpikeThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local caster_str = math.floor(caster:GetStrength() )
	local caster_int = math.floor(caster:GetIntellect() )
	
	if not caster:HasScepter() then
		local counter_buff = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_counter", nil)
			counter_buff = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter")
		end

		if counter_buff:GetStackCount() < caster_str then
			counter_buff:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack", nil)
		elseif counter_buff:GetStackCount() > caster_str and caster:HasModifier("modifier_storm_spirit_energy_spike_stack") then
			counter_buff:DecrementStackCount()
			caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack"):Destroy()
		end
	else
		local counter_buff = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter")
		
		if caster:HasModifier("modifier_storm_spirit_energy_spike_stack") then
			counter_buff:DecrementStackCount()
			caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack"):Destroy()
		end
	end
	
	if caster:HasScepter() then
		local counter_buff2 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_scepter")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff2 variable so it's no longer nil.
		if counter_buff2 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_counter_scepter", nil)
			counter_buff2 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_scepter")
		end

		if counter_buff2:GetStackCount() < caster_str then
			counter_buff2:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_scepter", nil)
		elseif counter_buff2:GetStackCount() > caster_str and caster:HasModifier("modifier_storm_spirit_energy_spike_stack_scepter") then
			counter_buff2:DecrementStackCount()
			caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_scepter"):Destroy()
		end
	else
		local counter_buff2 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_scepter")
		
		if caster:HasModifier("modifier_storm_spirit_energy_spike_stack_scepter") then
			counter_buff2:DecrementStackCount()
			caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_scepter"):Destroy()
		end
	end
	
	
	if not caster:HasScepter() then
		local counter_buff3 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter2")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff3 variable so it's no longer nil.
		if counter_buff3 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_counter2", nil)
			counter_buff3 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter2")
		end

		if counter_buff3:GetStackCount() < caster_int then
			counter_buff3:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack2", nil)
		elseif counter_buff3:GetStackCount() > caster_int and caster:HasModifier("modifier_storm_spirit_energy_spike_stack2") then
			counter_buff3:DecrementStackCount()
			caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack2"):Destroy()
		end
	else
		local counter_buff3 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter2")
		
		if caster:HasModifier("modifier_storm_spirit_energy_spike_stack2") then
			counter_buff3:DecrementStackCount()
			caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack2"):Destroy()
		end
	end
	
	if caster:HasScepter() then
		local counter_buff4 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_scepter2")
		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff4 variable so it's no longer nil.
		if counter_buff4 == nil then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_counter_scepter2", nil)
			counter_buff4 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_scepter2")
		end

		if counter_buff4:GetStackCount() < caster_int then
			counter_buff4:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_scepter2", nil)
		elseif counter_buff4:GetStackCount() > caster_int and caster:HasModifier("modifier_storm_spirit_energy_spike_stack_scepter2") then
			counter_buff4:DecrementStackCount()
			caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_scepter2"):Destroy()
		end
	else
		local counter_buff4 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_scepter2")
		
		if caster:HasModifier("modifier_storm_spirit_energy_spike_stack_scepter2") then
			counter_buff4:DecrementStackCount()
			caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_scepter2"):Destroy()
		end
	end
end

function SpikeThinkBall( keys )
	local caster = keys.caster
	local ability = keys.ability
	local caster_str = math.floor(caster:GetStrength() )
	local caster_int = math.floor(caster:GetIntellect() )
	local modifier_neg_str = "modifier_storm_spirit_energy_spike_neg_str"
	local modifier_neg_int = "modifier_storm_spirit_energy_spike_neg_int"
	local modifier_neg_str_scepter = "modifier_storm_spirit_energy_spike_neg_str_scepter"
	local modifier_neg_int_scepter = "modifier_storm_spirit_energy_spike_neg_int_scepter"
	
	if caster:HasModifier("modifier_storm_spirit_ball_lightning") then
		--remove all fountain buff only for overthrow
		caster:RemoveModifierByName("modifier_fountain_aura_buff")
		
		if caster:HasScepter() then
			caster:RemoveModifierByName(modifier_neg_str)
			caster:RemoveModifierByName(modifier_neg_int)
			ability:ApplyDataDrivenModifier(caster, caster, modifier_neg_str_scepter, {})
			caster:SetModifierStackCount(modifier_neg_str_scepter, ability, caster_str)
			ability:ApplyDataDrivenModifier(caster, caster, modifier_neg_int_scepter, {})
			caster:SetModifierStackCount(modifier_neg_int_scepter, ability, caster_int)
		else
			caster:RemoveModifierByName(modifier_neg_str_scepter)
			caster:RemoveModifierByName(modifier_neg_int_scepter)
			ability:ApplyDataDrivenModifier(caster, caster, modifier_neg_str, {})
			caster:SetModifierStackCount(modifier_neg_str, ability, caster_str)
			ability:ApplyDataDrivenModifier(caster, caster, modifier_neg_int, {})
			caster:SetModifierStackCount(modifier_neg_int, ability, caster_int)
		end
	else
		caster:RemoveModifierByName(modifier_neg_str)
		caster:RemoveModifierByName(modifier_neg_int)
		caster:RemoveModifierByName(modifier_neg_str_scepter)
		caster:RemoveModifierByName(modifier_neg_int_scepter)
	end
end