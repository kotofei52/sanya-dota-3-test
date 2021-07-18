function Illusions( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local debuff = "modifier_item_twin_jewels_cold_attack"
	local coldDuration = ability:GetLevelSpecialValueFor( "cold_duration", ability:GetLevel() - 1 )
	
	if target:IsBuilding() or caster:IsIllusion() then return 1
	else
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_item_skadi_slow", { duration = coldDuration })
	end
end
