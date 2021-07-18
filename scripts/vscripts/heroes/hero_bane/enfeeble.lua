function enfeeble_op(keys)	
	if keys.caster:GetTeam() == keys.target:GetTeam() then  --If Medallion of Courage is cast on an ally.
		if keys.caster ~= keys.target then  --If Medallion of Courage wasn't self-casted.
			keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_enfeeble_op_buff", nil)
		else  --If Medallion of Courage was self-casted, which it's not supposed to be able to do.
			keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_enfeeble_op_buff", nil)
		end
	else  --If Medallion of Courage is cast on an enemy.
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_enfeeble_op_debuff", nil)
	end
end