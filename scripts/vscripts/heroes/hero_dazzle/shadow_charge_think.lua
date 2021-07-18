function ShadowThink(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local attacker = keys.attacker
	local poison_touch = caster:FindAbilityByName("dazzle_poison_touch")
	local shallow_grave = caster:FindAbilityByName("dazzle_shallow_grave")
	local shadow_wave = caster:FindAbilityByName("dazzle_shadow_wave")

	if target.GetInvulnCount == nil then
		if caster:HasScepter() then
			if not poison_touch:IsCooldownReady() and not shallow_grave:IsCooldownReady() and not shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_3_scepter", {duration = 0.03})
			elseif poison_touch:IsCooldownReady() and not shallow_grave:IsCooldownReady() and not shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_2_scepter", {duration = 0.03})
			elseif not poison_touch:IsCooldownReady() and shallow_grave:IsCooldownReady() and not shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_2_scepter", {duration = 0.03})
			elseif not poison_touch:IsCooldownReady() and not shallow_grave:IsCooldownReady() and shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_2_scepter", {duration = 0.03})
			elseif poison_touch:IsCooldownReady() and shallow_grave:IsCooldownReady() and not shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_1_scepter", {duration = 0.03})
			elseif poison_touch:IsCooldownReady() and not shallow_grave:IsCooldownReady() and shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_1_scepter", {duration = 0.03})
			elseif not poison_touch:IsCooldownReady() and shallow_grave:IsCooldownReady() and shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_1_scepter", {duration = 0.03})
			else
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff", {duration = 0.03})
			end
		else
			if not poison_touch:IsCooldownReady() and not shallow_grave:IsCooldownReady() and not shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_3", {duration = 0.03})
			elseif poison_touch:IsCooldownReady() and not shallow_grave:IsCooldownReady() and not shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_2", {duration = 0.03})
			elseif not poison_touch:IsCooldownReady() and shallow_grave:IsCooldownReady() and not shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_2", {duration = 0.03})
			elseif not poison_touch:IsCooldownReady() and not shallow_grave:IsCooldownReady() and shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_2", {duration = 0.03})
			elseif poison_touch:IsCooldownReady() and shallow_grave:IsCooldownReady() and not shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_1", {duration = 0.03})
			elseif poison_touch:IsCooldownReady() and not shallow_grave:IsCooldownReady() and shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_1", {duration = 0.03})
			elseif not poison_touch:IsCooldownReady() and shallow_grave:IsCooldownReady() and shadow_wave:IsCooldownReady() then
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff_1", {duration = 0.03})
			else
				ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_dazzle_shadow_charge_lifesteal_buff", {duration = 0.03})
			end
		end
	end
end