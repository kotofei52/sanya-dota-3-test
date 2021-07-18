function scepter_check_level( keys )
local caster = keys.caster
local ultimate = keys.ability
local ABILITY = caster:FindAbilityByName("jakiro_liquid_ice")
local ability_level = ultimate:GetLevel()

	if ABILITY and ability_level == 0 then ABILITY:SetLevel(0) end
	if ABILITY and ability_level == 1 then ABILITY:SetLevel(1) end
	if ABILITY and ability_level == 2 then ABILITY:SetLevel(2) end
	if ABILITY and ability_level == 3 then ABILITY:SetLevel(3) end
	if ABILITY and ability_level == 4 then ABILITY:SetLevel(4) end
	if ABILITY and ability_level == 5 then ABILITY:SetLevel(5) end
end