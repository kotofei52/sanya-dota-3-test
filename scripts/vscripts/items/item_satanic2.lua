function modifier_item_vladmir_datadriven_lifesteal_aura_on_attack_landed(keys)
	if keys.target.GetInvulnCount == nil then
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.attacker, "modifier_item_satanic_lifesteal_active_buff", {duration = 0.03})
	end
end

function modifier_item_vladmir_datadriven_lifesteal_aura_on_attack_landed2(keys)
	if keys.target.GetInvulnCount == nil then
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.attacker, "modifier_item_satanic_lifesteal_buff", {duration = 0.03})
	end
end

function item_mask_of_sacrifice_on_spell_start(keys)
	--if not keys.caster:HasModifier("modifier_item_satanic_buff") then
	--	keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_satanic", nil)
	--end
	
	keys.caster:Purge(false, true, false, false, false)
	keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_satanic_buff", nil)
	keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_satanic_lifesteal_active", nil)
end

function item_satanic2_equip(keys)
	keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_satanic", nil)
end

function item_satanic2_unequip(keys)
	keys.caster:RemoveModifierByName("modifier_item_satanic")
end

function item_satanic2_equip2(keys)
	if not keys.caster:HasModifier("modifier_item_trident") then
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_trident", nil)
	end
end

function item_satanic2_unequip2(keys)
	keys.caster:RemoveModifierByName("modifier_item_trident")
end