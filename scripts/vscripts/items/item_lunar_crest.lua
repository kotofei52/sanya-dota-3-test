function item_lunar_crest_on_spell_start(keys)	
	if keys.caster:GetTeam() == keys.target:GetTeam() then
		if keys.caster ~= keys.target then
			keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_lunar_crest_debuff_self", nil)
			keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_item_lunar_crest_buff", nil)
			
			keys.target:EmitSound("Item.StarEmblem.Friendly")
		else
			keys.ability:RefundManaCost()
			keys.ability:EndCooldown()
			EmitSoundOnClient("General.CastFail_InvalidTarget_Hero", keys.caster:GetPlayerOwner())
			
			FireGameEvent('custom_error_show', {player_ID = keys.caster:GetPlayerID(), _error = "Ability Can't Target Self"})
		end
	else
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_item_lunar_crest_debuff_self", nil)
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_item_lunar_crest_debuff", nil)
		
		keys.target:EmitSound("Item.StarEmblem.Enemy")
	end
end