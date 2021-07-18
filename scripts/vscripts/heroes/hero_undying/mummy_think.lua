function MummyHeal( keys )
	local caster = keys.caster
	local target = keys.target
	
	if caster:HasScepter() then
		caster:Heal((30 + math.floor(caster:GetStrength() * 1.4)), caster)
	else
		caster:Heal((15 + math.floor(caster:GetStrength() * 0.7)), caster)
	end
	target:RemoveModifierByName("modifier_undying_mummy_emitter_enemy")
	target:RemoveModifierByName("modifier_undying_mummy_emitter_enemy_ally")
	target:RemoveModifierByName("modifier_undying_mummy_emitter")
	target:RemoveModifierByName("modifier_undying_mummy_emitter_ally")
end

function MummyEnemyHit( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local modifier = keys.modifier
	
	if not target:HasModifier(modifier) and target:GetTeamNumber() ~= caster:GetTeamNumber() and target:GetName() ~= "npc_dota_courier" and target:GetName() ~= "npc_dota_flying_courier" and target:GetName() ~= "npc_dota_unit_undying_zombie" and target:GetName() ~= "npc_dota_unit_undying_zombie_torso" and not caster:IsIllusion() then
		ability:ApplyDataDrivenModifier(caster, target, modifier, {})
		if caster:HasScepter() then
			ability:ApplyDataDrivenModifier(caster, target, "modifier_undying_mummy_slow_scepter", {})
		else
			ability:ApplyDataDrivenModifier(caster, target, "modifier_undying_mummy_slow", {})
		end
		ability:ApplyDataDrivenModifier(caster, target, "modifier_undying_mummy_emitter_enemy", {})
		ability:ApplyDataDrivenModifier(caster, target, "modifier_undying_mummy_emitter_enemy_ally", {})
	end
	
end

function MummyAllyHit( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local modifier = keys.modifier
	local modifier2 = keys.modifier2
	
	if not target:HasModifier(modifier) and target:GetTeamNumber() == caster:GetTeamNumber() and target:GetName() ~= "npc_dota_courier" and target:GetName() ~= "npc_dota_flying_courier" and target:GetName() ~= "npc_dota_unit_undying_zombie" and target:GetName() ~= "npc_dota_unit_undying_zombie_torso" and not caster:IsIllusion() then
		ability:ApplyDataDrivenModifier(caster, target, modifier, {})
		ability:ApplyDataDrivenModifier(caster, target, "modifier_undying_mummy_emitter", {})
		ability:ApplyDataDrivenModifier(caster, target, "modifier_undying_mummy_emitter_ally", {})
	elseif not target:HasModifier(modifier) and not target:HasModifier(modifier2) and target:GetTeamNumber() ~= caster:GetTeamNumber() and target:GetName() ~= "npc_dota_courier" and target:GetName() ~= "npc_dota_flying_courier" and target:GetName() ~= "npc_dota_unit_undying_zombie" and target:GetName() ~= "npc_dota_unit_undying_zombie_torso" and not caster:IsIllusion() then
		ability:ApplyDataDrivenModifier(caster, target, modifier2, {})
		if caster:HasScepter() then
			ability:ApplyDataDrivenModifier(caster, target, "modifier_undying_mummy_slow_scepter", {})
		else
			ability:ApplyDataDrivenModifier(caster, target, "modifier_undying_mummy_slow", {})
		end
		ability:ApplyDataDrivenModifier(caster, target, "modifier_undying_mummy_emitter_enemy", {})
		ability:ApplyDataDrivenModifier(caster, target, "modifier_undying_mummy_emitter_enemy_ally", {})
	end
	
end