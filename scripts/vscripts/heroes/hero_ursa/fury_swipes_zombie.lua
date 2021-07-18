function fury_swipes_attack( keys )
	-- Variables
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local modifierName = "modifier_hunger_target"
	local modifierBuff = "modifier_hunger_caster_buff"
	local exceptionName = "put_your_exception_unit_here"
	
	-- Necessary value from KV
	local duration = ability:GetLevelSpecialValueFor( "bonus_reset_time", ability:GetLevel() - 1 )
	if target:GetName() == exceptionName then	-- Put exception here
		duration = ability:GetLevelSpecialValueFor( "bonus_reset_time_roshan", ability:GetLevel() - 1 )
	end
	local duration_self = ability:GetLevelSpecialValueFor( "bonus_reset_time_self", ability:GetLevel() - 1 )
	
	if not (target:GetLevel() < 20 and target:IsHero()) then
		-- Check if unit already have stack
		if target:HasModifier( modifierName ) then
			local current_stack = target:GetModifierStackCount( modifierName, ability )
			
			ability:ApplyDataDrivenModifier( caster, target, modifierName, { Duration = duration } )
			target:SetModifierStackCount( modifierName, ability, current_stack + 1 )
		else
			ability:ApplyDataDrivenModifier( caster, target, modifierName, { Duration = duration } )
			target:SetModifierStackCount( modifierName, ability, 1 )
		end
	end

	if not (target:GetLevel() < 10 and target:IsHero()) then
		if caster:HasModifier( modifierBuff ) then
			local current_stack = caster:GetModifierStackCount( modifierBuff, ability )
			
			ability:ApplyDataDrivenModifier( caster, caster, modifierBuff, { Duration = duration_self } )
			caster:SetModifierStackCount( modifierBuff, ability, current_stack + 1 )
		else
			ability:ApplyDataDrivenModifier( caster, caster, modifierBuff, { Duration = duration_self } )
			caster:SetModifierStackCount( modifierBuff, ability, 1 )
		end
	end
end