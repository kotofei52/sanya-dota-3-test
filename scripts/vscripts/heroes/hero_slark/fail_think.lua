function FailThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local health_perc = caster:GetHealthPercent()
	local dark_pact = caster:FindAbilityByName("slark_dark_pact")
	local caster_agi = math.floor(caster:GetAgility() )
	
	local caster_agi_scepter = math.floor(caster:GetAgility() * 2)

	if (health_perc == 100) then
		caster:RemoveModifierByName("modifier_slark_failsafe_cooldown")
	elseif (health_perc < 35) then
		if caster:IsStunned() and not caster:HasModifier("modifier_slark_failsafe_cooldown") and dark_pact:IsCooldownReady() then
			if keys.caster:HasScepter() then
				caster:Heal(caster_agi_scepter, caster)
			else
				caster:Heal(caster_agi, caster)
			end
			caster:Purge(false, true, false, true, true)
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_slark_failsafe_cooldown", {})
			caster:EmitSound("Hero_Slark.DarkPact.PreCast")
		end
	end
end