function ArmyThink(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local cleave_damage_pct = ability:GetLevelSpecialValueFor("cleave_damage_percent", (ability:GetLevel() - 1))
	local cleave_damage = caster:GetAverageTrueAttackDamage(caster) * (cleave_damage_pct / 100)
	local cleave_start = ability:GetLevelSpecialValueFor("cleave_starting_width", (ability:GetLevel() - 1))
	local cleave_end = ability:GetLevelSpecialValueFor("cleave_ending_width", (ability:GetLevel() - 1))
	local cleave_distance = ability:GetLevelSpecialValueFor("cleave_distance", (ability:GetLevel() - 1))
	
	if caster:HasModifier("modifier_axe_berserkers_call_armor") or target:HasModifier("modifier_axe_battle_hunger") or caster:HasModifier("modifier_axe_culling_blade_boost") or caster:HasScepter() then
		DoCleaveAttack(caster, target, ability, cleave_damage, cleave_start, cleave_end, cleave_distance, "particles/items_fx/battlefury_cleave.vpcf" )
		keys.target:EmitSound("DOTA_Item.BattleFury")
	end
end