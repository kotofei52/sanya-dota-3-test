function RuggedThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local GROW = caster:FindAbilityByName("tiny_grow")
	local grow_level = GROW:GetLevel()
	
	if grow_level == 0 then
		if not caster:HasModifier("modifier_tiny_rugged_exterior_block") then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_tiny_rugged_exterior_block", nil)
		end
	elseif grow_level == 1 then
		if not caster:HasModifier("modifier_tiny_rugged_exterior_block_grow1") then
			caster:RemoveModifierByName("modifier_tiny_rugged_exterior_block")
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_tiny_rugged_exterior_block_grow1", nil)
		end
	elseif grow_level == 2 then
		if not caster:HasModifier("modifier_tiny_rugged_exterior_block_grow2") then
			caster:RemoveModifierByName("modifier_tiny_rugged_exterior_block")
			caster:RemoveModifierByName("modifier_tiny_rugged_exterior_block_grow1")
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_tiny_rugged_exterior_block_grow2", nil)
		end
	elseif grow_level == 3 then
		if not caster:HasModifier("modifier_tiny_rugged_exterior_block_grow3") then
			caster:RemoveModifierByName("modifier_tiny_rugged_exterior_block")
			caster:RemoveModifierByName("modifier_tiny_rugged_exterior_block_grow1")
			caster:RemoveModifierByName("modifier_tiny_rugged_exterior_block_grow2")
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_tiny_rugged_exterior_block_grow3", nil)
		end
	end
	
	if caster:HasScepter() then
		if grow_level == 0 then
			if not caster:HasModifier("modifier_tiny_rugged_exterior_mr") then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_tiny_rugged_exterior_mr", nil)
			end
		elseif grow_level == 1 then
			if not caster:HasModifier("modifier_tiny_rugged_exterior_mr_grow1") then
				caster:RemoveModifierByName("modifier_tiny_rugged_exterior_mr")
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_tiny_rugged_exterior_mr_grow1", nil)
			end
		elseif grow_level == 2 then
			if not caster:HasModifier("modifier_tiny_rugged_exterior_mr_grow2") then
				caster:RemoveModifierByName("modifier_tiny_rugged_exterior_mr")
				caster:RemoveModifierByName("modifier_tiny_rugged_exterior_mr_grow1")
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_tiny_rugged_exterior_mr_grow2", nil)
			end
		elseif grow_level == 3 then
			if not caster:HasModifier("modifier_tiny_rugged_exterior_mr_grow3") then
				caster:RemoveModifierByName("modifier_tiny_rugged_exterior_mr")
				caster:RemoveModifierByName("modifier_tiny_rugged_exterior_mr_grow1")
				caster:RemoveModifierByName("modifier_tiny_rugged_exterior_mr_grow2")
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_tiny_rugged_exterior_mr_grow3", nil)
			end
		end
	else
		caster:RemoveModifierByName("modifier_tiny_rugged_exterior_mr")
		caster:RemoveModifierByName("modifier_tiny_rugged_exterior_mr_grow1")
		caster:RemoveModifierByName("modifier_tiny_rugged_exterior_mr_grow2")
		caster:RemoveModifierByName("modifier_tiny_rugged_exterior_mr_grow3")
	end
	
end