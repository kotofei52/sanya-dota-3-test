
--[[ ============================================================================================================
	Author: Rook
	Date: January 26, 2015
	Called when Mekansm is cast.  Heals nearby units if they have not been healed by a Mekansm recently.
	Additional parameters: keys.HealAmount and keys.HealRadius
================================================================================================================= ]]
function item_mekansm_datadriven_on_spell_start(keys)	
	keys.caster:EmitSound("Item.GuardianGreaves.Activate")
	ParticleManager:CreateParticle("particles/items3_fx/warmage.vpcf", PATTACH_ABSORIGIN_FOLLOW, keys.caster)

	local nearby_allied_units = FindUnitsInRadius(keys.caster:GetTeam(), keys.caster:GetAbsOrigin(), nil, keys.Radius,
		DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
		
	for i, nearby_ally in ipairs(nearby_allied_units) do  --Restore health and play a particle effect for every found ally.
		nearby_ally:Heal(keys.HealAmount, keys.caster)
		nearby_ally:GiveMana(keys.ManaAmount)
		
		nearby_ally:EmitSound("Item.GuardianGreaves.Target")
		ParticleManager:CreateParticle("particles/items3_fx/warmage_recipient.vpcf", PATTACH_ABSORIGIN_FOLLOW, nearby_ally)
	end
	
	keys.caster:Purge(false, true, false, true, true)
end

function gg2think( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local health_perc = target:GetHealthPercent()

	if (health_perc > 25) then
		target:RemoveModifierByName("modifier_item_gg2_aura_bonus1")
	else
		if not target:HasModifier("modifier_item_gg2_aura_bonus1") then
			ability:ApplyDataDrivenModifier(caster, target, "modifier_item_gg2_aura_bonus1", {})
		else return 1 end
	end
end