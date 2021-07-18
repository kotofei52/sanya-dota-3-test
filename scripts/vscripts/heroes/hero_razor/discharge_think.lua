function Return( event )
	-- Variables
	local caster = event.caster
	local attacker = event.attacker
	local ability = event.ability
	local damage = ability:GetLevelSpecialValueFor( "proc_damage" , ability:GetLevel() - 1  )
	local breakDuration = ability:GetLevelSpecialValueFor( "proc_duration" , ability:GetLevel() - 1  )
	local damageType = ability:GetAbilityDamageType()

	-- Damage
	if attacker:IsBuilding() or caster:IsIllusion() or attacker:IsMagicImmune() then return 1
		else
		if attacker:GetTeamNumber() ~= caster:GetTeamNumber() then
			ApplyDamage({ victim = attacker, attacker = caster, damage = damage, damage_type = damageType })
			ability:ApplyDataDrivenModifier(caster, attacker, event.modifier_break, { duration = breakDuration } )
		end
	end
end

function ReturnScepter( event )
	-- Variables
	local caster = event.caster
	local target = event.target
	local ability = event.ability
	local damage = ability:GetLevelSpecialValueFor( "proc_damage" , ability:GetLevel() - 1  )
	local breakDuration = ability:GetLevelSpecialValueFor( "proc_duration" , ability:GetLevel() - 1  )
	local damageType = ability:GetAbilityDamageType()

	-- Damage
	if target:IsBuilding() or caster:IsIllusion() or target:IsMagicImmune() then return 1
		else
		if target:GetTeamNumber() ~= caster:GetTeamNumber() then
			ApplyDamage({ victim = target, attacker = caster, damage = damage, damage_type = damageType })
			ability:ApplyDataDrivenModifier(caster, target, event.modifier_break, { duration = breakDuration } )
		end
	end
end

function DisThink( keys )
	local caster = keys.caster
	local ability = keys.ability

	if caster:HasScepter() then
		if not caster:HasModifier("modifier_razor_return_scepter") then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_razor_return_scepter", {})
		end
	else
		caster:RemoveModifierByName("modifier_razor_return_scepter")
	end
end