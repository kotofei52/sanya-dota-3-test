function TurbulenceThink(event)
	local caster = event.caster
	local ability = event.ability
	local modifierBuffName = "modifier_zephyr_turbulence_disjoint"
	local modifierBuffNameScepter = "modifier_zephyr_turbulence_disjoint_scepter"
	local cooldown = ability:GetCooldown(ability:GetLevel())
	
	if event.caster:HasScepter() then
		if ability:IsCooldownReady() and caster:FindModifierByName("modifier_zephyr_turbulence_disjoint_scepter") == nil then
			caster:EmitSound("Brewmaster_Storm.Cyclone")
			ability:ApplyDataDrivenModifier(caster, caster, modifierBuffNameScepter, {})
			
			ability:UseResources(false,false,true)
			
			Timers:CreateTimer(0.01, function() 
				caster.TurbulenceParticle = ParticleManager:CreateParticle( "particles/units/heroes/hero_brewmaster/brewmaster_cyclone_leaves.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
				caster.TurbulenceParticle2 = ParticleManager:CreateParticle( "particles/units/heroes/hero_brewmaster/brewmaster_cyclone_funnel_twigs.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
				caster.TurbulenceParticle3 = ParticleManager:CreateParticle( "particles/units/heroes/hero_brewmaster/brewmaster_cyclone_funnel_leaves.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
			end)
		end
	else
		if ability:IsCooldownReady() and caster:FindModifierByName("modifier_zephyr_turbulence_disjoint") == nil then
			caster:EmitSound("Brewmaster_Storm.Cyclone")
			ability:ApplyDataDrivenModifier(caster, caster, modifierBuffName, {})
			
			ability:UseResources(false,false,true)
			
			Timers:CreateTimer(0.01, function() 
				caster.TurbulenceParticle = ParticleManager:CreateParticle( "particles/units/heroes/hero_brewmaster/brewmaster_cyclone_leaves.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
				caster.TurbulenceParticle2 = ParticleManager:CreateParticle( "particles/units/heroes/hero_brewmaster/brewmaster_cyclone_funnel_twigs.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
				caster.TurbulenceParticle3 = ParticleManager:CreateParticle( "particles/units/heroes/hero_brewmaster/brewmaster_cyclone_funnel_leaves.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
			end)
		end
	end
end

function TurbulenceThink_disjoint(event)
	local caster = event.caster
	
	ProjectileManager:ProjectileDodge(caster)
end

function TurbulenceThink_destroy(event)
	local caster = event.caster
	
	caster:StopSound("Brewmaster_Storm.Cyclone")
	ParticleManager:DestroyParticle(caster.TurbulenceParticle, false)
	ParticleManager:DestroyParticle(caster.TurbulenceParticle2, false)
	ParticleManager:DestroyParticle(caster.TurbulenceParticle3, false)
end