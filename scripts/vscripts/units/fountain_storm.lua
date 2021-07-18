function CheckStorm(keys)
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local exceptionName = "npc_dota_hero_storm_spirit"
	local modifier = keys.modifier

	if target:GetName() == exceptionName then
		ability:ApplyDataDrivenModifier(caster, target, modifier, nil)
	end
end

function RemoveStorm(keys)
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local exceptionName = "npc_dota_hero_storm_spirit"
	local modifier = keys.modifier

	if target:GetName() == exceptionName then
		target:RemoveModifierByName(modifier)
	end
end