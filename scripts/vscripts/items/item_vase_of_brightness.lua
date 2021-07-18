
--[[ ============================================================================================================
	Author: Rook
	Date: January 26, 2015
	Called when a unit with Urn of Shadows' heal modifier takes damage.  Removes the modifier if the damage was caused
	by a hero or tower.
	Additional parameters: keys.Damage
================================================================================================================= ]]
function modifier_item_urn_of_shadows_datadriven_heal_on_take_damage(keys)
	--Remove all Urn healing modifiers if this unit was damaged by an enemy hero or tower.
	if keys.Damage > 0 and (keys.attacker:GetName() == "npc_dota_roshan" or keys.attacker:IsHero()) then
		keys.unit:RemoveModifierByName("modifier_item_urn_of_shadows_datadriven_heal")
	end
end


--[[ ============================================================================================================
	Author: Rook
	Date: January 26, 2015
	Called when Urn of Shadows is cast.  Applies the healing or damaging modifier, depending on if the targeted unit is
	an ally or enemy.
================================================================================================================= ]]
function item_urn_of_shadows_datadriven_on_spell_start(keys)
	keys.target:EmitSound("DOTA_Item.UrnOfShadows.Activate")
	
	if keys.caster:GetTeam() == keys.target:GetTeam() then   --Apply the healing version of the Urn modifier.
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_item_urn_of_shadows_datadriven_heal", nil)
	else  --Apply the damaging version of the Urn modifier.
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_item_urn_of_shadows_datadriven_damage", nil)
	end
end