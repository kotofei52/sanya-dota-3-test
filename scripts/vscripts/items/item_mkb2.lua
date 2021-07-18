function Illusions( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local debuff = "modifier_item_monkey_king_bar_datadriven_bash"
	local damage = ability:GetLevelSpecialValueFor( "bash_damage", ability:GetLevel() - 1 )
	
	if target:IsBuilding() or caster:IsIllusion() or target:IsMagicImmune() then return 1
	else
		--ability:ApplyDataDrivenModifier(caster, target, debuff, {})
		local damageTable = {
			victim = target,
			attacker = caster,
			damage = damage,
			damage_type = DAMAGE_TYPE_MAGICAL
		}
		ApplyDamage( damageTable )
		target:EmitSound("DOTA_Item.MKB.Minibash")
	end
end
