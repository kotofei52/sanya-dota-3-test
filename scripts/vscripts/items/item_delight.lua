function Poison( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local debuff = "modifier_item_roamer_delight_poison"
	
	if target:IsBuilding() or target:IsMagicImmune() or caster:GetTeamNumber() == target:GetTeamNumber() then return 1
	else
		ability:ApplyDataDrivenModifier(caster, target, debuff, {})
	end
end