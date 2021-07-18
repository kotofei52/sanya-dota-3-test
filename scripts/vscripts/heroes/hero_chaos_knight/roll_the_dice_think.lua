function stack_created1(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_str_counter")
	local counter_buff_scepter = params.caster:FindModifierByName("modifier_rtd_str_scepter_counter")
	local scepter = params.caster:HasScepter()

	-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
	
	if scepter then
		if counter_buff_scepter == nil then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_str_scepter_counter", nil)
			counter_buff_scepter = params.caster:FindModifierByName("modifier_rtd_str_scepter_counter")
		end
		
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff_scepter:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_str_scepter", nil)
			counter_buff_scepter:IncrementStackCount()
			counter_buff_scepter:SetDuration(params.duration_scepter, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.caster:FindModifierByName("modifier_rtd_str_scepter"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_str_scepter", nil)
			counter_buff_scepter:IncrementStackCount()
			counter_buff_scepter:SetDuration(params.duration_scepter, true)
		end
	else
		if counter_buff == nil then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_str_counter", nil)
			counter_buff = params.caster:FindModifierByName("modifier_rtd_str_counter")
		end
		
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_str", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.caster:FindModifierByName("modifier_rtd_str"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_str", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)
		end
	end
	
end

function stack_created2(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_attack_counter")
	local counter_buff_scepter = params.caster:FindModifierByName("modifier_rtd_attack_speed_scepter_counter")
	local scepter = params.caster:HasScepter()

	-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.

	if scepter then
		if counter_buff_scepter == nil then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_attack_speed_scepter_counter", nil)
			counter_buff_scepter = params.caster:FindModifierByName("modifier_rtd_attack_speed_scepter_counter")
		end
		
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff_scepter:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_attack_speed_scepter", nil)
			counter_buff_scepter:IncrementStackCount()
			counter_buff_scepter:SetDuration(params.duration_scepter, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.caster:FindModifierByName("modifier_rtd_attack_speed_scepter"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_attack_speed_scepter", nil)
			counter_buff_scepter:IncrementStackCount()
			counter_buff_scepter:SetDuration(params.duration_scepter, true)
		end
	else
		if counter_buff == nil then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_attack_counter", nil)
			counter_buff = params.caster:FindModifierByName("modifier_rtd_attack_counter")
		end
	
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_attack_speed", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.caster:FindModifierByName("modifier_rtd_attack_speed"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_attack_speed", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)
		end
	end
	
end

function stack_created3(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_move_speed_counter")
	local counter_buff_scepter = params.caster:FindModifierByName("modifier_rtd_move_speed_scepter_counter")
	local scepter = params.caster:HasScepter()

	-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.

	if scepter then
		if counter_buff_scepter == nil then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_move_speed_scepter_counter", nil)
			counter_buff_scepter = params.caster:FindModifierByName("modifier_rtd_move_speed_scepter_counter")
		end
		
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff_scepter:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_move_speed_scepter", nil)
			counter_buff_scepter:IncrementStackCount()
			counter_buff_scepter:SetDuration(params.duration_scepter, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.caster:FindModifierByName("modifier_rtd_move_speed_scepter"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_move_speed_scepter", nil)
			counter_buff_scepter:IncrementStackCount()
			counter_buff_scepter:SetDuration(params.duration_scepter, true)
		end
	else
		if counter_buff == nil then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_move_speed_counter", nil)
			counter_buff = params.caster:FindModifierByName("modifier_rtd_move_speed_counter")
		end
		
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_move_speed", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.caster:FindModifierByName("modifier_rtd_move_speed"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_move_speed", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)
		end
	end
	
end

function stack_created4(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_hp_regen_counter")
	local counter_buff_scepter = params.caster:FindModifierByName("modifier_rtd_hp_regen_scepter_counter")
	local scepter = params.caster:HasScepter()

	-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.

	if scepter then
		if counter_buff_scepter == nil then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_hp_regen_scepter_counter", nil)
			counter_buff_scepter = params.caster:FindModifierByName("modifier_rtd_hp_regen_scepter_counter")
		end
		
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff_scepter:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_hp_regen_scepter", nil)
			counter_buff_scepter:IncrementStackCount()
			counter_buff_scepter:SetDuration(params.duration_scepter, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.caster:FindModifierByName("modifier_rtd_hp_regen_scepter"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_hp_regen_scepter", nil)
			counter_buff_scepter:IncrementStackCount()
			counter_buff_scepter:SetDuration(params.duration_scepter, true)
		end
	else
		if counter_buff == nil then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_hp_regen_counter", nil)
			counter_buff = params.caster:FindModifierByName("modifier_rtd_hp_regen_counter")
		end
		
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_hp_regen", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.caster:FindModifierByName("modifier_rtd_hp_regen"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_hp_regen", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)
		end
	end
	
end

function stack_created5(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_mana_regen_counter")
	local counter_buff_scepter = params.caster:FindModifierByName("modifier_rtd_mana_regen_scepter_counter")
	local scepter = params.caster:HasScepter()

	-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.

	if scepter then
		if counter_buff_scepter == nil then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_mana_regen_scepter_counter", nil)
			counter_buff_scepter = params.caster:FindModifierByName("modifier_rtd_mana_regen_scepter_counter")
		end
		
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff_scepter:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_mana_regen_scepter", nil)
			counter_buff_scepter:IncrementStackCount()
			counter_buff_scepter:SetDuration(params.duration_scepter, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.caster:FindModifierByName("modifier_rtd_mana_regen_scepter"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_mana_regen_scepter", nil)
			counter_buff_scepter:IncrementStackCount()
			counter_buff_scepter:SetDuration(params.duration_scepter, true)
		end
	else
		if counter_buff == nil then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_mana_regen_counter", nil)
			counter_buff = params.caster:FindModifierByName("modifier_rtd_mana_regen_counter")
		end
		
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_mana_regen", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.caster:FindModifierByName("modifier_rtd_mana_regen"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_rtd_mana_regen", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)
		end
	end
	
end

function stack_destroyed1(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_str_counter")

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
	end
end

function stack_destroyed2(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_attack_counter")

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
	end
end

function stack_destroyed3(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_move_speed_counter")

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
	end
end

function stack_destroyed4(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_hp_regen_counter")

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
	end
end

function stack_destroyed5(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_mana_regen_counter")

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
	end
end

function stack_destroyed6(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_str_scepter_counter")

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
	end
end

function stack_destroyed7(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_attack_speed_scepter_counter")

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
	end
end

function stack_destroyed8(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_move_speed_scepter_counter")

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
	end
end

function stack_destroyed9(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_hp_regen_scepter_counter")

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
	end
end

function stack_destroyed10(params)
	local counter_buff = params.caster:FindModifierByName("modifier_rtd_mana_regen_scepter_counter")

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
	end
end