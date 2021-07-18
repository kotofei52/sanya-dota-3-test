function demonic_rage_cooldown(event)
	local caster = event.caster
	local ability = event.ability
	local cooldown = ability:GetCooldown(ability:GetLevel())
	
	if ability:IsCooldownReady() then
		ability:ApplyDataDrivenModifier(caster,caster,"modifier_duality_of_demon_buff",{})
		
		ability:StartCooldown(cooldown)
	end
end

function demonic_rage_cooldown_scepter(event)
	local caster = event.caster
	local attacker = event.attacker
	local ability = event.ability
	
	if attacker:IsHero() then
		ability:ApplyDataDrivenModifier(caster,caster,"modifier_duality_of_demon_buff",{})
		else return 1
	end
end

function RageThink( keys )
	local caster = keys.caster
	local ability = keys.ability

	if caster:HasScepter() then
		if not caster:HasModifier("modifier_duality_of_demon_scepter") then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_duality_of_demon_scepter", {})
		end
	else
		caster:RemoveModifierByName("modifier_duality_of_demon_scepter")
	end
end