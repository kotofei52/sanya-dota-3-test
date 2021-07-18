function Butterfly2Start(keys)
	local caster = keys.caster
	local ability = keys.ability
	
	ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_butterfly2_extra", nil)
	ProjectileManager:ProjectileDodge(caster)
	caster:Purge(false, true, false, false, false)
end