function Illusions( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local debuff = "modifier_sure_shot_debuff"
	local damage = ability:GetLevelSpecialValueFor( "damage_tooltip", ability:GetLevel() - 1 )
	local damageType = ability:GetAbilityDamageType()
	
	if target:IsBuilding() or caster:IsIllusion() or target:IsMagicImmune() then return 1
	else
		ability:ApplyDataDrivenModifier(caster, target, debuff, {})
		local damageTable = {
			victim = target,
			attacker = caster,
			damage = damage,
			damage_type = damageType
		}
		ApplyDamage( damageTable )
	end
end

