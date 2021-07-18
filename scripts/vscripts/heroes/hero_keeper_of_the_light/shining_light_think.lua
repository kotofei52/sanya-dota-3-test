function ShineThink(keys)
	local caster = keys.caster
	local ability = keys.ability
	local attacker = keys.attacker
	local dura = ability:GetLevelSpecialValueFor( "stack_duration" , ability:GetLevel() - 1  )
	local dura_scepter = ability:GetLevelSpecialValueFor( "stack_duration_scepter" , ability:GetLevel() - 1  )
	local modifierName = "modifier_kotl_shining_light_stack"
	local modifierNameCount = "modifier_kotl_shining_light_stack_count"
	
	if attacker:IsBuilding() or caster:IsIllusion() or attacker:IsMagicImmune() then return 1
		else
		
		if attacker:GetTeamNumber() ~= caster:GetTeamNumber() then
		
			if caster:HasScepter() then
				if attacker:HasModifier(modifierName) then
					local current_stack = attacker:GetModifierStackCount(modifierName, caster)
					
					ability:ApplyDataDrivenModifier(caster, attacker, modifierName, {duration = dura_scepter})
					attacker:SetModifierStackCount(modifierName, ability, current_stack + 1)
				else
					ability:ApplyDataDrivenModifier(caster, attacker, modifierName, {duration = dura_scepter})
					attacker:SetModifierStackCount(modifierName, ability, 1)
				end
			else
				if attacker:HasModifier(modifierName) then
					local current_stack = attacker:GetModifierStackCount(modifierName, caster)
					
					ability:ApplyDataDrivenModifier(caster, attacker, modifierName, {duration = dura})
					attacker:SetModifierStackCount(modifierName, ability, current_stack + 1)
				else
					ability:ApplyDataDrivenModifier(caster, attacker, modifierName, {duration = dura})
					attacker:SetModifierStackCount(modifierName, ability, 1)
				end
			end
			
			if attacker:HasModifier(modifierNameCount) then
				local current_stack_count = attacker:GetModifierStackCount(modifierNameCount, caster)
				
				ability:ApplyDataDrivenModifier(caster, attacker, modifierNameCount, {})
				attacker:SetModifierStackCount(modifierNameCount, ability, current_stack_count + 1)
			else
				ability:ApplyDataDrivenModifier(caster, attacker, modifierNameCount, {})
				attacker:SetModifierStackCount(modifierNameCount, ability, 1)
			end
		end
	end
end

function ShineRemove(keys)
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	
	local current_stack_count_target = target:GetModifierStackCount("modifier_kotl_shining_light_stack_count", caster)

	local damage = (ability:GetLevelSpecialValueFor( "stack_damage", ability:GetLevel() - 1 ) * current_stack_count_target)
	
	if target:IsBuilding() or caster:IsIllusion() or target:IsMagicImmune() then return 1
	else
		if caster:HasScepter() then
			local damageTable = {
				victim = target,
				attacker = caster,
				damage = damage,
				damage_type = DAMAGE_TYPE_PURE
			}
			ApplyDamage( damageTable )
		else
			local damageTable = {
				victim = target,
				attacker = caster,
				damage = damage,
				damage_type = DAMAGE_TYPE_MAGICAL
			}
			ApplyDamage( damageTable )
		end
		target:SetModifierStackCount("modifier_kotl_shining_light_stack_count",caster,0)
	end
end