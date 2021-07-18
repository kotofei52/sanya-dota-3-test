function HoundThink( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local modifier2 = keys.modifier2
	local modifier3 = keys.modifier3
	local modifier4 = keys.modifier4
	local current_ms = caster:GetMoveSpeedModifier(caster:GetBaseMoveSpeed(), false)
	
	local current_as = (math.ceil(caster:GetIncreasedAttackSpeed() * 100) + 100)
	
	if caster:HasScepter() then
		if current_ms < 315 then
			ability:ApplyDataDrivenModifier(caster, caster, modifier2, {})
		end
	else
		if current_ms < 300 then
			ability:ApplyDataDrivenModifier(caster, caster, modifier, {})
		end
	end
	
	if caster:HasScepter() then
		if current_as < 140 then
			ability:ApplyDataDrivenModifier(caster, caster, modifier4, {})
		end
	else
		if current_as < 125 then
			ability:ApplyDataDrivenModifier(caster, caster, modifier3, {})
		end
	end
	
	if caster:HasScepter() then
		if not caster:HasModifier("modifier_bs_hound_buff_scepter_passive") then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_bs_hound_buff_scepter_passive", {})
		end
	else
		caster:RemoveModifierByName("modifier_bs_hound_buff_scepter_passive")
	end
end