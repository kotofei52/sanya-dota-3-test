function Spawn( keys )
	GameRules:GetGameModeEntity():SetThink(scepter_check_lua)
end

function scepter_check_lua( keys )
if thisEntity:IsNull() then return 1 else
local scepter = thisEntity:HasScepter()

	if scepter then
		ABILITY = thisEntity:FindAbilityByName("chaos_knight_phantom")
		if ABILITY then ABILITY:SetLevel(1) end
		GameRules:GetGameModeEntity():SetThink(scepter_drop_check_lua)
		return 1
	end
	return 1
end
end

function scepter_drop_check_lua( keys )
if thisEntity:IsNull() then return 1 else
local scepter = thisEntity:HasScepter()

	if not scepter then
		ABILITY = thisEntity:FindAbilityByName("chaos_knight_phantom")
		if ABILITY then ABILITY:SetLevel(0) end
		GameRules:GetGameModeEntity():SetThink(scepter_check_lua)
		return 1
	end
	return 1
end
end