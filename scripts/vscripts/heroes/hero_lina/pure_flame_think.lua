function PureFlame( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local fiery_stacks = caster:GetModifierStackCount("modifier_lina_fiery_soul", caster)
	local damage = (caster:GetAverageTrueAttackDamage(caster) * (0.15 + (fiery_stacks * 0.02)))
	
	if target:IsBuilding() or caster:IsIllusion() then return 1 else
		if caster:HasScepter() then
			local damageTable = {
				victim = target,
				attacker = caster,
				damage = damage,
				damage_type = DAMAGE_TYPE_PURE
			}
			ApplyDamage( damageTable )
		else
			if target:IsMagicImmune() then return 1 else
				local damageTable = {
					victim = target,
					attacker = caster,
					damage = damage,
					damage_type = DAMAGE_TYPE_MAGICAL
				}
				ApplyDamage( damageTable )
			end
		end
	end
end