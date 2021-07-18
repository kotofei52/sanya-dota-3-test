function SyncThink( keys )
	local caster = keys.caster
	local ability = keys.ability

	if caster:IsSilenced() then
		if caster:HasScepter() and not caster:HasModifier("modifier_sync_silence_scepter") then
			caster:RemoveModifierByName("modifier_sync_silence")
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_sync_silence_scepter", nil)
		elseif not caster:HasScepter() and not caster:HasModifier("modifier_sync_silence") then
			caster:RemoveModifierByName("modifier_sync_silence_scepter")
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_sync_silence", nil)
		end
	else
		caster:RemoveModifierByName("modifier_sync_silence")
		caster:RemoveModifierByName("modifier_sync_silence_scepter")
	end
	
	if caster:IsMuted() then
		if caster:HasScepter() and not caster:HasModifier("modifier_sync_mute_scepter") then
			caster:RemoveModifierByName("modifier_sync_mute")
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_sync_mute_scepter", nil)
		elseif not caster:HasScepter() and not caster:HasModifier("modifier_sync_mute") then
			caster:RemoveModifierByName("modifier_sync_mute_scepter")
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_sync_mute", nil)
		end
	else
		caster:RemoveModifierByName("modifier_sync_mute")
		caster:RemoveModifierByName("modifier_sync_mute_scepter")
	end
	
	if caster:IsDisarmed() then
		if caster:HasScepter() and not caster:HasModifier("modifier_sync_disarm_scepter") then
			caster:RemoveModifierByName("modifier_sync_disarm")
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_sync_disarm_scepter", nil)
		elseif not caster:HasScepter() and not caster:HasModifier("modifier_sync_disarm") then
			caster:RemoveModifierByName("modifier_sync_disarm_scepter")
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_sync_disarm", nil)
		end
	else
		caster:RemoveModifierByName("modifier_sync_disarm")
		caster:RemoveModifierByName("modifier_sync_disarm_scepter")
	end
end