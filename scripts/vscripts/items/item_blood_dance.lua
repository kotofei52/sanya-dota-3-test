function modifier_item_blood_dance_lifesteal(keys)
	if keys.target.GetInvulnCount == nil then
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.attacker, "modifier_item_blood_dance_ls", {duration = 0.03})
	end
end

function modifier_item_blood_dance_lifesteal2(keys)
	if keys.target.GetInvulnCount == nil then
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.attacker, "modifier_item_blood_dance_ls_active", {duration = 0.03})
	end
end

function modifier_item_blood_dance_active_stacks(keys)
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local max_stacks = 10

	-- Check if the caster has the attack speed modifier
	if caster:HasModifier(modifier) then
		-- Get the current stacks
		local stack_count = caster:GetModifierStackCount(modifier, ability)

		-- Check if the current stacks are lower than the maximum allowed
		if stack_count < max_stacks then
			-- Increase the count if they are
			caster:SetModifierStackCount(modifier, ability, stack_count + 1)
		end
	else
		-- Apply the attack speed modifier and set the starting stack number
		ability:ApplyDataDrivenModifier(caster, caster, modifier, {})
		caster:SetModifierStackCount(modifier, ability, 1)
	end
end

function modifier_item_blood_dance_active_convert(keys)
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local modifier2 = keys.modifier2

	-- Check if the caster has the attack speed modifier
	if caster:HasModifier(modifier) then
		ability:ApplyDataDrivenModifier(caster, caster, modifier2, {})
		-- Get the current stacks
		local stack_count = caster:GetModifierStackCount(modifier, ability)

		caster:SetModifierStackCount(modifier2, ability, stack_count)
		caster:SetModifierStackCount(modifier, ability, 0)
		caster:RemoveModifierByName(modifier)
	else
		return 1
	end
end