function modifier_dragonbane_on_attack_landed_random_on_success(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local debuff = "modifier_item_dragonbane_slow"
	local damage = ability:GetLevelSpecialValueFor( "proc_damage", ability:GetLevel() - 1 )
	
	if target:IsBuilding() or caster:IsIllusion() or target:IsMagicImmune() then return 1
	else
		keys.target:EmitSound("n_creep_dragonspawnOverseer.Death")
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.target, "modifier_item_dragonbane_slow", nil)
		local damageTable = {
			victim = target,
			attacker = caster,
			damage = damage,
			damage_type = DAMAGE_TYPE_PURE
		}
		ApplyDamage( damageTable )
	end
end