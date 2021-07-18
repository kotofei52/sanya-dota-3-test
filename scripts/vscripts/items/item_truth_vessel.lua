
--[[ ============================================================================================================
	Author: Rook
	Date: January 26, 2015
	Called when a unit with Urn of Shadows' heal modifier takes damage.  Removes the modifier if the damage was caused
	by a hero or tower.
	Additional parameters: keys.Damage
================================================================================================================= ]]
function modifier_item_truth_vessel_heal_on_take_damage(keys)
	--Remove all Urn healing modifiers if this unit was damaged by an enemy hero or tower.
	if keys.Damage > 0 and (keys.attacker:GetName() == "npc_dota_roshan" or keys.attacker:IsHero()) then
		keys.unit:RemoveModifierByName("modifier_item_truth_vessel_heal")
	end
end


--[[ ============================================================================================================
	Author: Rook
	Date: January 26, 2015
	Called when Urn of Shadows is cast.  Applies the healing or damaging modifier, depending on if the targeted unit is
	an ally or enemy.
================================================================================================================= ]]
function item_truth_vessel_on_spell_start(keys)
	keys.caster:EmitSound("DOTA_Item.SpiritVessel.Cast")
	
	if keys.caster:GetTeam() == keys.target:GetTeam() then   --Apply the healing version of the Urn modifier.
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_item_truth_vessel_heal", nil)
		keys.target:EmitSound("DOTA_Item.SpiritVessel.Target.Ally")
	else  --Apply the damaging version of the Urn modifier.
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_item_truth_vessel_damage", nil)
		keys.target:EmitSound("DOTA_Item.SpiritVessel.Target.Enemy")
	end
end

function TruthManaThink( keys )
	local target = keys.target
	local caster = keys.caster
	local ability = keys.ability
	local current_mana_percent = ability:GetLevelSpecialValueFor('soul_damage_amount_per', (ability:GetLevel() - 1))
	local target_current_mana = target:GetMana()
	local manaBurnPct = (current_mana_percent * target_current_mana) / 100

	-- If the target is not magic immune then reduce the mana
	if not target:IsMagicImmune() then
		target:ReduceMana(manaBurnPct)
	end
end