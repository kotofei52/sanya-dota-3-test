function item_sun_on_spell_start(keys)	
	if keys.caster:GetTeam() == keys.target:GetTeam() then
		if keys.caster ~= keys.target then
			keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_item_sun_buff", nil)
			
			keys.target:EmitSound("Item.StarEmblem.Friendly")
		else
			keys.ability:RefundManaCost()
			keys.ability:EndCooldown()
			EmitSoundOnClient("General.CastFail_InvalidTarget_Hero", keys.caster:GetPlayerOwner())
			
			FireGameEvent('custom_error_show', {player_ID = keys.caster:GetPlayerID(), _error = "Ability Can't Target Self"})
		end
	else
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_item_sun_debuff", nil)
		
		keys.target:EmitSound("Item.StarEmblem.Enemy")
	end
end

function modifier_item_sun_aura_on_interval_think(keys)
	local damage_to_deal = keys.AuraDamagePerSecond * keys.AuraDamageInterval   --This gives us the damage per interval.
	ApplyDamage({victim = keys.target, attacker = keys.caster, damage = damage_to_deal, damage_type = DAMAGE_TYPE_MAGICAL,})
end