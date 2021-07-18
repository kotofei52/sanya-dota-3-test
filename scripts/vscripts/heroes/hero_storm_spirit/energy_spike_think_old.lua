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

function SpikeThinkBall2( keys ) --testing only
	local caster = keys.caster
	local ability = keys.ability
	
	if caster:HasModifier("modifier_storm_spirit_ball_lightning") then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_nohp", nil)
	else
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_nohp")
	end
end

function SpikeThinkBall( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local mana_regen = (math.floor(caster:GetManaRegen() * 10) / 10)
	
	local caster_mana_regen_int_1, caster_mana_regen_dec_1 = math.modf(mana_regen) -- splits 5432.1 to 5432 and 0.1
	
	local caster_mana_regen_big_1 = caster_mana_regen_int_1 -- equal 5432
	local caster_mana_regen_small_1 = math.floor(caster_mana_regen_dec_1 * 10) -- equal 1
	
	local caster_mana_regen_int_10, caster_mana_regen_dec_10 = math.modf(caster_mana_regen_big_1 / 10) -- splits 543.2 to 543 and 0.2
	
	local caster_mana_regen_big_10 = caster_mana_regen_int_10 -- equal 543
	local caster_mana_regen_small_10 = math.floor(caster_mana_regen_dec_10 * 10) -- equal 2
	
	local caster_mana_regen_int_100, caster_mana_regen_dec_100 = math.modf(caster_mana_regen_big_10 / 10) -- splits 54.3 to 54 and 0.3
	
	local caster_mana_regen_big_100 = caster_mana_regen_int_100 -- equal 54
	local caster_mana_regen_small_100 = math.floor(caster_mana_regen_dec_100 * 10) -- equal 3
	
	local caster_mana_regen_int_1000, caster_mana_regen_dec_1000 = math.modf(caster_mana_regen_big_100 / 10) -- splits 5.4 to 5 and 0.4
	
	local caster_mana_regen_big_1000 = caster_mana_regen_int_1000 -- equal 5
	local caster_mana_regen_small_1000 = math.floor(caster_mana_regen_dec_1000 * 10) -- equal 4
	
	if caster:HasModifier("modifier_storm_spirit_ball_lightning") then
		if not caster:HasModifier("modifier_storm_spirit_energy_spike_nohp") then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_nohp", nil)
		end
	
		if mana_regen > 1000 then
			local counter_buff1000 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big1000")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff1000 variable so it's no longer nil.
			if counter_buff1000 == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_counter_mana_big1000", nil)
				counter_buff1000 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big1000")
			end
			counter_buff1000:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_mana_big1000", nil)
		elseif mana_regen > 100 then
			local counter_buff100 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big100")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff100 variable so it's no longer nil.
			if counter_buff100 == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_counter_mana_big100", nil)
				counter_buff100 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big100")
			end
			counter_buff100:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_mana_big100", nil)
		elseif mana_regen > 10 then
			local counter_buff10 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big10")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff10 variable so it's no longer nil.
			if counter_buff10 == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_counter_mana_big10", nil)
				counter_buff10 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big10")
			end
			counter_buff10:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_mana_big10", nil)
		elseif mana_regen > 1 then
			local counter_buff1 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff1 variable so it's no longer nil.
			if counter_buff1 == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_counter_mana_big", nil)
				counter_buff1 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big")
			end
			counter_buff1:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_mana_big", nil)
		elseif mana_regen > 0 then
			local counter_buff0 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana")
			-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff0 variable so it's no longer nil.
			if counter_buff0 == nil then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_counter_mana", nil)
				counter_buff0 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana")
			end
			counter_buff0:IncrementStackCount()
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_storm_spirit_energy_spike_stack_mana", nil)
		elseif mana_regen < -1000 then
			local counter_buff1000 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big1000")
			
			if caster:HasModifier("modifier_storm_spirit_energy_spike_stack_mana_big1000") then
				counter_buff1000:DecrementStackCount()
				caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_mana_big1000"):Destroy()
			end
		elseif mana_regen < -100 then
			local counter_buff100 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big100")
			
			if caster:HasModifier("modifier_storm_spirit_energy_spike_stack_mana_big100") then
				counter_buff100:DecrementStackCount()
				caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_mana_big100"):Destroy()
			end
		elseif mana_regen < -10 then
			local counter_buff10 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big10")
			
			if caster:HasModifier("modifier_storm_spirit_energy_spike_stack_mana_big10") then
				counter_buff10:DecrementStackCount()
				caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_mana_big10"):Destroy()
			end
		elseif mana_regen < -1 then
			local counter_buff1 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big")
			
			if caster:HasModifier("modifier_storm_spirit_energy_spike_stack_mana_big") then
				counter_buff1:DecrementStackCount()
				caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_mana_big"):Destroy()
			end
		elseif mana_regen < 0 then
			local counter_buff0 = caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana")
			
			if caster:HasModifier("modifier_storm_spirit_energy_spike_stack_mana") then
				counter_buff0:DecrementStackCount()
				caster:FindModifierByName("modifier_storm_spirit_energy_spike_stack_mana"):Destroy()
			end
		end
	else
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_nohp")
		
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big1000")
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big100")
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big10")
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana_big")
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_stack_counter_mana")
		
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_stack_mana_big1000")
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_stack_mana_big100")
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_stack_mana_big10")
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_stack_mana_big")
		caster:RemoveModifierByName("modifier_storm_spirit_energy_spike_stack_mana")
	end
end