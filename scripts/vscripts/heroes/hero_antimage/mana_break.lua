function ManaBreak( keys )
	local target = keys.target
	local caster = keys.caster
	local ability = keys.ability
	local manaBurn = ability:GetLevelSpecialValueFor("mana_per_hit", (ability:GetLevel() - 1))
	local current_mana_percent = ability:GetLevelSpecialValueFor('mana_per_hit_pct', (ability:GetLevel() - 1))
	local manaDamage = ability:GetLevelSpecialValueFor("damage_per_burn", (ability:GetLevel() - 1))
	local target_current_mana = target:GetMana()
	local manaBurnPct = (current_mana_percent * target_current_mana) / 100

	local damageTable = {}
	damageTable.attacker = caster
	damageTable.victim = target
	damageTable.damage_type = ability:GetAbilityDamageType()
	damageTable.ability = ability
	
	if (target_current_mana > 0) then
		keys.target:EmitSound("Hero_Antimage.ManaBreak")
	end

	-- If the target is not magic immune then reduce the mana and deal damage
	if not target:IsMagicImmune() then
		-- Checking the mana of the target and calculating the damage
		if(target:GetMana() >= (manaBurn + manaBurnPct) ) then
			damageTable.damage = (manaBurn + manaBurnPct) * manaDamage
			target:ReduceMana(manaBurn + manaBurnPct)
		else
			damageTable.damage = target:GetMana() * manaDamage
			target:ReduceMana(manaBurn + manaBurnPct)
		end

		ApplyDamage(damageTable)
	end
end