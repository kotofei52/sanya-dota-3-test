function levelup( keys )
local scepter = thisEntity:HasScepter()

	ABILITY = thisEntity:FindAbilityByName("skeleton_king_passive")
	if ABILITY then ABILITY:SetLevel(1) end
end