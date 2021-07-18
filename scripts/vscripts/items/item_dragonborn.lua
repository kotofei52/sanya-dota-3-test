function modifier_dragonborn_on_attack_landed_random_on_success(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local debuff = "modifier_item_dragonborn_slow"
	local damage = ability:GetLevelSpecialValueFor( "proc_damage", ability:GetLevel() - 1 )
	
	if target:IsBuilding() or caster:IsIllusion() or target:IsMagicImmune() or caster:HasModifier("modifier_item_dragonborn_self") then return 1
	else
		keys.target:EmitSound("n_creep_dragonspawnOverseer.Death")
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.target, "modifier_item_dragonborn_slow", nil)
		local damageTable = {
			victim = target,
			attacker = caster,
			damage = damage,
			damage_type = DAMAGE_TYPE_PURE
		}
		ApplyDamage( damageTable )
	end
end

function item_check_ranged(keys)
	local caster = keys.caster
	local ability = keys.ability

	if caster:IsRangedAttacker() then
		ability:ApplyDataDrivenModifier(caster,caster,"modifier_item_dragonborn_range",{})
	else
		caster:RemoveModifierByName("modifier_item_dragonborn_range")
	end 
end