function Increment(params)
	if params.caster:IsIllusion() or not params.caster:IsAlive() then return 1 else
		local counter_buff = params.caster:FindModifierByName("modifier_zephyr_cyclone_counter")

		-- If the counter buff doesn't exist, create it. After creation, reassign the counter_buff variable so it's no longer nil.
		if counter_buff == nil then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_zephyr_cyclone_counter", nil)
			counter_buff = params.caster:FindModifierByName("modifier_zephyr_cyclone_counter")
				
			local target = params.caster
			local shield_size = 425 -- could be adjusted to model scale
				
			-- Particle. Need to wait one frame for the older particle to be destroyed
			Timers:CreateTimer(0.01, function() 
				target.ShieldParticle = ParticleManager:CreateParticle("particles/zephyr_cyclone_shield.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
				ParticleManager:SetParticleControl(target.ShieldParticle, 1, Vector(shield_size,0,shield_size))
				ParticleManager:SetParticleControl(target.ShieldParticle, 2, Vector(shield_size,0,shield_size))
				ParticleManager:SetParticleControl(target.ShieldParticle, 4, Vector(shield_size,0,shield_size))
				ParticleManager:SetParticleControl(target.ShieldParticle, 5, Vector(shield_size,0,0))

				-- Proper Particle attachment courtesy of BMD. Only PATTACH_POINT_FOLLOW will give the proper shield position
				ParticleManager:SetParticleControlEnt(target.ShieldParticle, 0, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin(), true)
				target.CycloneParticle = ParticleManager:CreateParticle( "particles/tornado_ambient_small.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
			end)
		end

		-- If the current amount of stacks is under the max, create a new stack, set the counter stack number, and reset the counter's duration.
		if counter_buff:GetStackCount() < params.max_stacks then
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_zephyr_cyclone_stack", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)

		-- Else, if we are over the number of maximum stacks, destroy a random stack and make a new one.
		else
			params.caster:FindModifierByName("modifier_zephyr_cyclone_stack"):Destroy()
			params.ability:ApplyDataDrivenModifier(params.caster, params.caster, "modifier_zephyr_cyclone_stack", nil)
			counter_buff:IncrementStackCount()
			counter_buff:SetDuration(params.duration, true)
		end
	end
end

function stack_destroyed(params)
	local counter_buff = params.caster:FindModifierByName("modifier_zephyr_cyclone_counter")
	
	params.caster:Heal(params.HealAmount, params.caster)

	-- If there's still stacks remaining, just decrement the stack counter.
	if counter_buff:GetStackCount() > 1 then
		counter_buff:DecrementStackCount()

	-- If the most recently destroyed stack was the last one, destroy the counter as well.
	else
		counter_buff:Destroy()
		local target = params.caster
		ParticleManager:DestroyParticle(target.ShieldParticle, false)
		ParticleManager:DestroyParticle(target.CycloneParticle, false)
	end
end

function consume_stack(params)
	local counter_buff = params.caster:FindModifierByName("modifier_zephyr_cyclone_counter")
	
	if counter_buff == nil then
		return 1
	else
		params.caster:FindModifierByName("modifier_zephyr_cyclone_stack"):Destroy()
	end
end