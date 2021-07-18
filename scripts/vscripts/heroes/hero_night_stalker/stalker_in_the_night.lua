function Spawn( keys )
	GameRules:GetGameModeEntity():SetThink(scepter_check_lua)
	DAY = thisEntity:FindAbilityByName("night_stalker_day")
	DAY:SetLevel(1)
end

function scepter_check_lua( keys )
local scepter = thisEntity:HasScepter()

	if scepter then
		ABILITY = thisEntity:FindAbilityByName("night_stalker_stalker_in_the_night_op")
		if ABILITY then ABILITY:SetLevel(1) end
		GameRules:GetGameModeEntity():SetThink(scepter_drop_check_lua)
		return 1
	end
	return 1
end

function scepter_drop_check_lua( keys )
local scepter = thisEntity:HasScepter()

	if not scepter then
		ABILITY = thisEntity:FindAbilityByName("night_stalker_stalker_in_the_night_op")
		if ABILITY then ABILITY:SetLevel(0) end
		thisEntity:RemoveModifierByName("modifier_hunter_in_the_night_op")
		thisEntity:RemoveModifierByName("modifier_hunter_in_the_night_buff_op")
		GameRules:GetGameModeEntity():SetThink(scepter_check_lua)
		return 1
	end
	return 1
end