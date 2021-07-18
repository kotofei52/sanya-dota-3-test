function modifier_wave_of_silence_knockback( keys )
	local vCaster = keys.caster:GetAbsOrigin()
	local vTarget = keys.target:GetAbsOrigin()
	local len = ( vTarget - vCaster ):Length2D()
	len = keys.distance - keys.distance * ( len / keys.distance )
	local knockbackModifierTable =
	{
		should_stun = 1,
		knockback_duration = keys.duration,
		duration = keys.duration,
		knockback_distance = len,
		knockback_height = 0,
		center_x = keys.caster:GetAbsOrigin().x,
		center_y = keys.caster:GetAbsOrigin().y,
		center_z = keys.caster:GetAbsOrigin().z
	}
	keys.target:AddNewModifier( keys.caster, nil, "modifier_knockback", knockbackModifierTable )
	keys.target:Purge(true, false, false, false, false)
end

function modifier_wave_of_silence_knockback2( keys )
	local vCaster = keys.caster:GetAbsOrigin()
	local vTarget = keys.target:GetAbsOrigin()
	local len = ( vTarget - vCaster ):Length2D()
	len = 0 - keys.distance * ( len / keys.distance )
	local knockbackModifierTable =
	{
		should_stun = 1,
		knockback_duration = keys.duration,
		duration = keys.duration,
		knockback_distance = len,
		knockback_height = 0,
		center_x = keys.caster:GetAbsOrigin().x,
		center_y = keys.caster:GetAbsOrigin().y,
		center_z = keys.caster:GetAbsOrigin().z
	}
	keys.target:AddNewModifier( keys.caster, nil, "modifier_knockback", knockbackModifierTable )
	keys.target:Purge(true, false, false, false, false)
end

function modifier_on_cast( keys )
	keys.caster:Purge(false, true, false, false, false)
end

function scepter_check_level( keys )
local caster = keys.caster
local ultimate = keys.ability
local ABILITY = caster:FindAbilityByName("zephyr_gust2")
local ability_level = ultimate:GetLevel()

	if ABILITY and ability_level == 0 then ABILITY:SetLevel(0) end
	if ABILITY and ability_level == 1 then ABILITY:SetLevel(1) end
	if ABILITY and ability_level == 2 then ABILITY:SetLevel(2) end
	if ABILITY and ability_level == 3 then ABILITY:SetLevel(3) end
	if ABILITY and ability_level == 4 then ABILITY:SetLevel(4) end
	if ABILITY and ability_level == 5 then ABILITY:SetLevel(5) end
end