function ToxinThink(keys)
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local dura = ability:GetLevelSpecialValueFor( "stack_duration" , ability:GetLevel() - 1  )
	local dura_scepter = ability:GetLevelSpecialValueFor( "stack_duration_scepter" , ability:GetLevel() - 1  )
	local modifierName = "modifier_qop_toxin_stack"
	local modifierNameSelf = "modifier_qop_toxin_stack_self"
	
	if target:IsBuilding() or caster:IsIllusion() or target:IsMagicImmune() then return 1
		else
		
		if target:GetTeamNumber() ~= caster:GetTeamNumber() then
		
			if caster:HasScepter() then
				if target:HasModifier(modifierName) then
					local current_stack = target:GetModifierStackCount(modifierName, caster)
					
					ability:ApplyDataDrivenModifier(caster, target, modifierName, {duration = dura_scepter})
					target:SetModifierStackCount(modifierName, ability, current_stack + 1)
				else
					ability:ApplyDataDrivenModifier(caster, target, modifierName, {duration = dura_scepter})
					target:SetModifierStackCount(modifierName, ability, 1)
				end
			else
				if target:HasModifier(modifierName) then
					local current_stack = target:GetModifierStackCount(modifierName, caster)
					
					ability:ApplyDataDrivenModifier(caster, target, modifierName, {duration = dura})
					target:SetModifierStackCount(modifierName, ability, current_stack + 1)
				else
					ability:ApplyDataDrivenModifier(caster, target, modifierName, {duration = dura})
					target:SetModifierStackCount(modifierName, ability, 1)
				end
			end
			
			if caster:HasScepter() then
				if caster:HasModifier(modifierNameSelf) then
					local current_stack_self = caster:GetModifierStackCount(modifierNameSelf, caster)
					
					ability:ApplyDataDrivenModifier(caster, caster, modifierNameSelf, {duration = dura_scepter})
					caster:SetModifierStackCount(modifierNameSelf, ability, current_stack_self + 1)
				else
					ability:ApplyDataDrivenModifier(caster, caster, modifierNameSelf, {duration = dura_scepter})
					caster:SetModifierStackCount(modifierNameSelf, ability, 1)
				end
			else
				if caster:HasModifier(modifierNameSelf) then
					local current_stack_self = caster:GetModifierStackCount(modifierNameSelf, caster)
					
					ability:ApplyDataDrivenModifier(caster, caster, modifierNameSelf, {duration = dura})
					caster:SetModifierStackCount(modifierNameSelf, ability, current_stack_self + 1)
				else
					ability:ApplyDataDrivenModifier(caster, caster, modifierNameSelf, {duration = dura})
					caster:SetModifierStackCount(modifierNameSelf, ability, 1)
				end
			end
			
		end
	end
end

function ToxinDamage(keys)
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local modifierName = "modifier_qop_toxin_stack"
	
	local current_stack = target:GetModifierStackCount(modifierName, caster)
	local damage = (ability:GetLevelSpecialValueFor( "stack_damage", ability:GetLevel() - 1 ) * current_stack)
	
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
	end
end