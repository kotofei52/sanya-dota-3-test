function Spawn( keys )
	GameRules:GetGameModeEntity():SetThink(scepter_check_lua)
end

function scepter_check_lua( keys )
local scepter = thisEntity:HasScepter()

	if scepter then
		ABILITY = thisEntity:FindAbilityByName("dragon_knight_dragon_blood_op")
		if ABILITY then ABILITY:ApplyDataDrivenModifier(thisEntity, thisEntity, "modifier_dragon_blood_scepter", {}) end
		return 1
	end
	return 1
end