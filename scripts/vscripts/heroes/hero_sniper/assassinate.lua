--[[
	Author: kritth
	Date: 6.1.2015.
	Register target
]]
function assassinate_register_target( keys )
	keys.caster.assassinate_target = keys.target
end

--[[
	Author: kritth
	Date: 6.1.2015.
	Remove debuff from target
]]
function assassinate_remove_target( keys )
	if keys.caster.assassinate_target then
		keys.caster.assassinate_target:RemoveModifierByName( "modifier_assassinate_target_datadriven" )
		keys.caster.assassinate_target = nil
	end
end

function scepter_check_level( keys )
local caster = keys.caster
local ultimate = keys.ability
local scepter = caster:HasScepter()
local ABILITY = caster:FindAbilityByName("sniper_assassinate_scepter")
local ability_level = ultimate:GetLevel()

	if scepter then
		if ABILITY and ability_level == 0 then ABILITY:SetLevel(0) end
		if ABILITY and ability_level == 1 then ABILITY:SetLevel(1) end
		if ABILITY and ability_level == 2 then ABILITY:SetLevel(2) end
		if ABILITY and ability_level == 3 then ABILITY:SetLevel(3) end
		if ABILITY and ability_level == 4 then ABILITY:SetLevel(4) end
	end
end