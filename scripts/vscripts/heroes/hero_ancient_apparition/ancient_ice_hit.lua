function Return( event )
	-- Variables
	local caster = event.caster
	local attacker = event.attacker
	local ability = event.ability
	local slow = ability:GetLevelSpecialValueFor( "attack_slow" , ability:GetLevel() - 1  )

	if attacker:IsBuilding() or caster:IsIllusion() or attacker:GetName() == "npc_dota_roshan" or attacker:IsMagicImmune() then return 1
		else
		
		if attacker:GetTeamNumber() ~= caster:GetTeamNumber() then
			local current_stack = attacker:FindModifierByName("modifier_ancient_ice_slow")
			if current_stack == nil then
				ability:ApplyDataDrivenModifier(caster, attacker, "modifier_ancient_ice_slow", {})
				current_stack = attacker:FindModifierByName("modifier_ancient_ice_slow")
			end
			
			current_stack:IncrementStackCount()
		end
		
		if caster:HasScepter() then
			if attacker:GetTeamNumber() ~= caster:GetTeamNumber() then
				local current_stack2 = attacker:FindModifierByName("modifier_ancient_ice_mr")
				if current_stack2 == nil then
					ability:ApplyDataDrivenModifier(caster, attacker, "modifier_ancient_ice_mr", {})
					current_stack2 = attacker:FindModifierByName("modifier_ancient_ice_mr")
				end
				
				current_stack2:IncrementStackCount()
			end
		end
	end
end