function ConcoctionThink(event)
	local caster = event.caster
	local ability = event.ability
	local cooldown = ability:GetCooldown(ability:GetLevel())
	
	local targetImpactTeam =  DOTA_UNIT_TARGET_TEAM_FRIENDLY
	local targetType = DOTA_UNIT_TARGET_HERO
	local targetFlag = DOTA_UNIT_TARGET_FLAG_NONE
	local units = FindUnitsInRadius(caster:GetTeamNumber(), caster:GetAbsOrigin(), caster, 99999, targetImpactTeam, targetType, targetFlag, FIND_ANY_ORDER, false )
	
	if ability:IsCooldownReady() and not caster:IsIllusion() then
		event.caster:EmitSound("DOTA_Item.MagicStick.Activate")
		event.caster:Purge(false, true, false, true, true)
		
		if caster:HasScepter() then
			for k, v in pairs( units ) do
				if v:HasScepter() then
					v:Purge(false, true, false, true, true)
				end
			end
		end
		
		ability:UseResources(false,false,true)
	end
end