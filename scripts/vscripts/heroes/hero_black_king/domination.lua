--[[Author: YOLOSPAGHETTI
	Date: February 13, 2016
	Scales target's model by 125%]]
function ChangeModel(keys)
	local target = keys.target
	local ability = keys.ability
	local model_scale = ability:GetLevelSpecialValueFor( "model_scale", ability:GetLevel() - 1 )
	
	-- Instant scaling, as opposed to the gradual way it happens in Dota
	target:SetModelScale(model_scale)
end

--[[Author: YOLOSPAGHETTI
	Date: February 13, 2016
	Reverts the target's model to normal scale]]
function RevertModel(keys)
	local target = keys.target
	
	-- Instant scaling, as opposed to the gradual way it happens in Dota
	target:SetModelScale(1.1)
end

function StatSteal(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local steal = ability:GetLevelSpecialValueFor( "stat_negative", ability:GetLevel() - 1 )
	
    target:ModifyIntellect(-steal) 
    target:ModifyStrength(-steal) 
    target:ModifyAgility(-steal) 
end

function StatReturn(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local steal = ability:GetLevelSpecialValueFor( "stat_negative", ability:GetLevel() - 1 )
	
	target:ModifyIntellect(steal) 
	target:ModifyStrength(steal) 
	target:ModifyAgility(steal) 
end

function StunThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	
	if caster:HasScepter() then
		ability:ApplyDataDrivenModifier(caster, target, "modifier_domination_stun_scepter", {})
	else
		ability:ApplyDataDrivenModifier(caster, target, "modifier_domination_stun", {})
	end
end

function StatThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	
	if caster:HasScepter() then
		target:RemoveModifierByName("modifier_domination_debuff")
		ability:ApplyDataDrivenModifier(caster, target, "modifier_domination_debuff_scepter", {})
	else
		target:RemoveModifierByName("modifier_domination_debuff_scepter")
		ability:ApplyDataDrivenModifier(caster, target, "modifier_domination_debuff", {})
	end
end