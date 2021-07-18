function SoulThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local health_perc = caster:GetHealthPercent()

	if (health_perc > 50) then
		caster:RemoveModifierByName("modifier_dragon_soul_50")
		caster:RemoveModifierByName("modifier_dragon_soul_50_scepter")
	else
		if keys.caster:HasScepter() then
			caster:RemoveModifierByName("modifier_dragon_soul_50")
			if not caster:HasModifier("modifier_dragon_soul_50_scepter") then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_dragon_soul_50_scepter", {})
			else return 1 end
		else
			caster:RemoveModifierByName("modifier_dragon_soul_50_scepter")
			if not caster:HasModifier("modifier_dragon_soul_50") then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_dragon_soul_50", {})
			else return 1 end
		end
	end
end

function stack_created(params)
	local counter_buff = params.unit:FindModifierByName("modifier_dragon_soul_counter")
	local scepter = params.unit:HasScepter()

	-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
	if counter_buff == nil then
		params.ability:ApplyDataDrivenModifier(params.unit, params.unit, "modifier_dragon_soul_counter", nil)
		counter_buff = params.unit:FindModifierByName("modifier_dragon_soul_counter")
	end

	if scepter then
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff:GetStackCount() < params.max_stacks_scepter then
			params.ability:ApplyDataDrivenModifier(params.unit, params.unit, "modifier_dragon_soul_stack", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.unit:FindModifierByName("modifier_dragon_soul_stack"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.unit, params.unit, "modifier_dragon_soul_stack", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)
		end
	else
		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.unit, params.unit, "modifier_dragon_soul_stack", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.unit:FindModifierByName("modifier_dragon_soul_stack"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.unit, params.unit, "modifier_dragon_soul_stack", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)
		end
	end
	
end

function stack_destroyed(params)
	local counter_buff = params.caster:FindModifierByName("modifier_dragon_soul_counter")

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
	end
end