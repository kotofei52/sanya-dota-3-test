function modifier_item_vladmir_datadriven_lifesteal_aura_on_attack_landed(keys)
	if keys.target.GetInvulnCount == nil then
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.attacker, "modifier_item_vladmir_datadriven_lifesteal_aura_lifesteal", {duration = 0.03})
	end
end