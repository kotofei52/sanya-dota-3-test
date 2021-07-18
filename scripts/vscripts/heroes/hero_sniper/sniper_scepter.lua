function Spawn( keys )
	GameRules:GetGameModeEntity():SetThink(scepter_check_lua)
end

function scepter_check_lua( keys )
local scepter = thisEntity:HasScepter()

	if scepter then
		ABILITY = thisEntity:FindAbilityByName("sniper_assassinate_scepter")
		ultimate = thisEntity:FindAbilityByName("sniper_assassinate_op")
		ability_level = ultimate:GetLevel()
		
		if ABILITY and ability_level == 0 then ABILITY:SetLevel(0) end
		if ABILITY and ability_level == 1 then ABILITY:SetLevel(1) end
		if ABILITY and ability_level == 2 then ABILITY:SetLevel(2) end
		if ABILITY and ability_level == 3 then ABILITY:SetLevel(3) end
		if ABILITY and ability_level == 4 then ABILITY:SetLevel(4) end
		GameRules:GetGameModeEntity():SetThink(scepter_drop_check_lua)
		return 1
	end
	return 1
end

function scepter_drop_check_lua( keys )
local scepter = thisEntity:HasScepter()

	if not scepter then
		ABILITY = thisEntity:FindAbilityByName("sniper_assassinate_scepter")
		if ABILITY then ABILITY:SetLevel(0) end
		GameRules:GetGameModeEntity():SetThink(scepter_check_lua)
		return 1
	end
	return 1
end