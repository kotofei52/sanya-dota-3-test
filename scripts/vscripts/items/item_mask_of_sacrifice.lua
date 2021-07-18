function modifier_item_vladmir_datadriven_lifesteal_aura_on_attack_landed(keys)
	if keys.target.GetInvulnCount == nil and not keys.target:IsHero() then
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.attacker, "modifier_item_mask_of_sacrifice_lifesteal_active_buff", {duration = 0.03})
	end
end

function modifier_item_vladmir_datadriven_lifesteal_aura_on_attack_landed2(keys)
	if keys.target.GetInvulnCount == nil then
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.attacker, "modifier_item_mask_of_sacrifice_lifesteal_buff", {duration = 0.03})
	end
end

function item_mask_of_sacrifice_on_spell_start(keys)
	keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_mask_of_sacrifice_buff", nil)
	keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_mask_of_sacrifice_lifesteal_active", nil)
	
	local caster = keys.caster
	local casterHealth = caster:GetHealth()
	if casterHealth  <= 400 then
		caster:Kill(keys.ability, caster)
	else
		caster:SetHealth( casterHealth - 400 )
	end
end