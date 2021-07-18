function item_soul_parasite_on_spell_start(keys)
	local caster = keys.caster
	local ability = keys.ability
	local casterHealth = caster:GetHealth()
	local health_sac = ability:GetLevelSpecialValueFor('health_sacrifice', (ability:GetLevel() - 1))
	local mana_sac = ability:GetLevelSpecialValueFor('mana_gain', (ability:GetLevel() - 1))
	
	
	if casterHealth <= health_sac then
		caster:GiveMana(((casterHealth - 1)/ health_sac) * mana_sac)
		caster:SetHealth(1)
	else
		caster:GiveMana(mana_sac)
		caster:SetHealth( casterHealth - health_sac )
	end
end