function Return( event )
	local caster = event.caster
	local attacker = event.attacker
	local ability = event.ability
	local damage = ability:GetLevelSpecialValueFor( "proc_damage" , ability:GetLevel() - 1  )
	local slowDuration = ability:GetLevelSpecialValueFor( "slow_duration" , ability:GetLevel() - 1  )
	local slowDuration_scepter = ability:GetLevelSpecialValueFor( "slow_duration_scepter" , ability:GetLevel() - 1  )

	if attacker:IsBuilding() or attacker:IsMagicImmune() then return 1
		else
		if attacker:GetTeamNumber() ~= caster:GetTeamNumber() then
			if caster:HasScepter() then
				ability:ApplyDataDrivenModifier(caster, attacker, event.modifier2, { duration = slowDuration_scepter } )
			else
				ability:ApplyDataDrivenModifier(caster, attacker, event.modifier, { duration = slowDuration } )
			end
		end
	end
end

function ReturnAtt( event )
	local caster = event.caster
	local target = event.target
	local ability = event.ability
	local damage = ability:GetLevelSpecialValueFor( "proc_damage" , ability:GetLevel() - 1  )
	local slowDuration = ability:GetLevelSpecialValueFor( "slow_duration" , ability:GetLevel() - 1  )
	local slowDuration_scepter = ability:GetLevelSpecialValueFor( "slow_duration_scepter" , ability:GetLevel() - 1  )

	if target:IsBuilding() or target:IsMagicImmune() then return 1
		else
		if target:GetTeamNumber() ~= caster:GetTeamNumber() then
			if caster:HasScepter() then
				ability:ApplyDataDrivenModifier(caster, target, event.modifier2, { duration = slowDuration_scepter } )
			else
				ability:ApplyDataDrivenModifier(caster, target, event.modifier, { duration = slowDuration } )
			end
		end
	end
end