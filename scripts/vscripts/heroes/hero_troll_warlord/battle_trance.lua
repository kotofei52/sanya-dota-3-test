function scepter_check_lua( keys )
local caster = keys.caster
local scepter = caster:HasScepter()

	if scepter then
		local ability = keys.ability
		local target = keys.target
		local rage = caster:FindAbilityByName("troll_warlord_berserkers_rage")
		local ability_level = rage:GetLevel()
		
		if ability_level == 1 then ability:ApplyDataDrivenModifier(caster, target, keys.modifier1, {})
		elseif ability_level == 2 then ability:ApplyDataDrivenModifier(caster, target, keys.modifier2, {})
		elseif ability_level == 3 then ability:ApplyDataDrivenModifier(caster, target, keys.modifier3, {})
		elseif ability_level == 4 then ability:ApplyDataDrivenModifier(caster, target, keys.modifier4, {})
		elseif ability_level == 5 then ability:ApplyDataDrivenModifier(caster, target, keys.modifier5, {})
		end
	end
end

function modifier_on_cast( keys )
	keys.target:Purge(false, true, false, false, false)
end