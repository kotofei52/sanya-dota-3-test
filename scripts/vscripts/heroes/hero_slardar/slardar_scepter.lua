function Spawn( keys )
	GameRules:GetGameModeEntity():SetThink(scepter_check_lua)
end

function scepter_check_lua( keys )
local scepter = thisEntity:HasScepter()

	if scepter then
		ABILITY = thisEntity:FindAbilityByName("slardar_amplify_damage_scepter")
		if ABILITY then ABILITY:SetLevel(1) end
		GameRules:GetGameModeEntity():SetThink(scepter_drop_check_lua)
		return 1
	end
	return 1
end

function scepter_drop_check_lua( keys )
local scepter = thisEntity:HasScepter()

	if not scepter then
		ABILITY = thisEntity:FindAbilityByName("slardar_amplify_damage_scepter")
		if ABILITY then ABILITY:SetLevel(0) end
		GameRules:GetGameModeEntity():SetThink(scepter_check_lua)
		return 1
	end
	return 1
end