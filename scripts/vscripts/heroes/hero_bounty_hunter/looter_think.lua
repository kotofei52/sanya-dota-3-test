function LooterThink(keys)
	local caster = keys.caster
	local ability = keys.ability
	local max_hp = caster:GetMaxHealth()
	local skill_1 = caster:FindAbilityByName("bounty_hunter_shuriken_toss")
	local skill_2 = caster:FindAbilityByName("bounty_hunter_jinada")
	local skill_3 = caster:FindAbilityByName("bounty_hunter_wind_walk")
	local skill_4 = caster:FindAbilityByName("bounty_hunter_track")
	
	skill_1:EndCooldown()
	skill_2:EndCooldown()
	skill_3:EndCooldown()
	skill_4:EndCooldown()
	
	if caster:HasScepter() then
		caster:Heal((max_hp * 0.15), caster)
	else
		caster:Heal((max_hp * 0.1), caster)
	end
end