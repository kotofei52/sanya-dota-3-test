function fury_swipes_attack( keys )
	-- Variables
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local modifierName = "modifier_fury_swipes_target_op"
	local modifierNameDebuff = "modifier_fury_swipes_debuff_stack"
	local damageType = ability:GetAbilityDamageType()
	
	-- Necessary value from KV
	local duration = ability:GetLevelSpecialValueFor( "bonus_reset_time", ability:GetLevel() - 1 )
	local damage_per_stack = ability:GetLevelSpecialValueFor( "damage_per_stack", ability:GetLevel() - 1 )
	local scepter = caster:HasScepter()
	if scepter then
		duration = ability:GetLevelSpecialValueFor("bonus_reset_time_scepter", ability:GetLevel() - 1)
	end
	
	if target.GetInvulnCount == nil and not target:IsBuilding() then
		-- Check if unit already have stack
		if target:HasModifier( modifierName ) then
			local current_stack = target:GetModifierStackCount( modifierName, ability )
			
			-- Deal damage
			local damage_table = {
				victim = target,
				attacker = caster,
				damage = damage_per_stack * current_stack,
				damage_type = damageType
			}
			ApplyDamage( damage_table )
			
			ability:ApplyDataDrivenModifier( caster, target, modifierName, { Duration = duration } )
			target:SetModifierStackCount( modifierName, ability, current_stack + 1 )
		else
			ability:ApplyDataDrivenModifier( caster, target, modifierName, { Duration = duration } )
			target:SetModifierStackCount( modifierName, ability, 1 )
		end
	end
	
	if scepter then
		if target:HasModifier( modifierNameDebuff ) then
			local current_stack_scepter = target:GetModifierStackCount( modifierNameDebuff, ability )
	
			ability:ApplyDataDrivenModifier( caster, target, modifierNameDebuff, { Duration = duration } )
			target:SetModifierStackCount( modifierNameDebuff, ability, current_stack_scepter + 1 )
		else
			ability:ApplyDataDrivenModifier( caster, target, modifierNameDebuff, { Duration = duration } )
			target:SetModifierStackCount( modifierNameDebuff, ability, 1 )
		end
	target:RemoveModifierByName("modifier_fury_swipes_debuff_op")
	AddStacks(ability, caster, target, keys.scepter_debuff, target:GetModifierStackCount( modifierNameDebuff, ability ), false)
	end
end