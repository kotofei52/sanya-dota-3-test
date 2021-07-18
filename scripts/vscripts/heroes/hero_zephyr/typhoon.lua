function RenderParticles(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local radius = ability:GetLevelSpecialValueFor("radius_all", ability:GetLevel() -1)
	
	ability.level = ability:GetLevel()
	
	ability.particle = ParticleManager:CreateParticle("particles/zephyr_cyclone_shield.vpcf", PATTACH_WORLDORIGIN, caster)
	ParticleManager:SetParticleControl(ability.particle, 0, target:GetAbsOrigin())
	ParticleManager:SetParticleControl(ability.particle, 1, Vector(radius, radius, 0))
	ParticleManager:SetParticleControl(ability.particle, 2, target:GetAbsOrigin())
	ability.CycloneParticle = ParticleManager:CreateParticle("particles/tornado_ambient_small.vpcf", PATTACH_WORLDORIGIN, caster)
	ParticleManager:SetParticleControl(ability.CycloneParticle, 0, target:GetAbsOrigin())
	ParticleManager:SetParticleControl(ability.CycloneParticle, 1, Vector(radius, radius, 0))
	ParticleManager:SetParticleControl(ability.CycloneParticle, 2, target:GetAbsOrigin())
	
	local target_point = caster:GetCursorPosition()
	local teamID = caster:GetTeamNumber()
	
	caster.dummy900 = CreateUnitByName("dummy_vision900", target_point, false, caster, caster, teamID)
end

function ParticlesDetroyed(keys)
	local ability = keys.ability
	local caster = keys.caster
	
	if ability.particle == nil then return 1 else
		ParticleManager:DestroyParticle(ability.particle, false)
		ParticleManager:DestroyParticle(ability.CycloneParticle, false)
		if caster.dummy900:IsNull() then return 1 else
			caster.dummy900:RemoveSelf()
		end
	end
end

function RenderParticles2(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local radius = ability:GetLevelSpecialValueFor("radius_big", ability:GetLevel() -1)
	
	ability.level = ability:GetLevel()
	
	ability.particle2 = ParticleManager:CreateParticle("particles/zephyr_cyclone_shield.vpcf", PATTACH_WORLDORIGIN, caster)
	ParticleManager:SetParticleControl(ability.particle2, 0, target:GetAbsOrigin())
	ParticleManager:SetParticleControl(ability.particle2, 1, Vector(radius, radius, 0))
	ParticleManager:SetParticleControl(ability.particle2, 2, target:GetAbsOrigin())
end

function ParticlesDetroyed2(keys)
	local ability = keys.ability
	
	if ability.particle2 == nil then return 1 else
		ParticleManager:DestroyParticle(ability.particle2, false)
	end
end

function RenderParticles3(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local radius = ability:GetLevelSpecialValueFor("radius_small", ability:GetLevel() -1)
	
	ability.level = ability:GetLevel()
	
	ability.particle3 = ParticleManager:CreateParticle("particles/zephyr_cyclone_shield.vpcf", PATTACH_WORLDORIGIN, caster)
	ParticleManager:SetParticleControl(ability.particle3, 0, target:GetAbsOrigin())
	ParticleManager:SetParticleControl(ability.particle3, 1, Vector(radius, radius, 0))
	ParticleManager:SetParticleControl(ability.particle3, 2, target:GetAbsOrigin())
end

function ParticlesDetroyed3(keys)
	local ability = keys.ability
	
	if ability.particle3 == nil then return 1 else
		ParticleManager:DestroyParticle(ability.particle3, false)
	end
end

function RenderParticles4(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local radius = ability:GetLevelSpecialValueFor("radius_center", ability:GetLevel() -1)
	
	ability.level = ability:GetLevel()
	
	ability.particle4 = ParticleManager:CreateParticle("particles/zephyr_cyclone_shield.vpcf", PATTACH_WORLDORIGIN, caster)
	ParticleManager:SetParticleControl(ability.particle4, 0, target:GetAbsOrigin())
	ParticleManager:SetParticleControl(ability.particle4, 1, Vector(radius, radius, 0))
	ParticleManager:SetParticleControl(ability.particle4, 2, target:GetAbsOrigin())
end

function ParticlesDetroyed4(keys)
	local ability = keys.ability
	
	if ability.particle4 == nil then return 1 else
		ParticleManager:DestroyParticle(ability.particle4, false)
	end
end

function ScepterThink(keys)
	local caster = keys.caster
	local ability = keys.ability
	local gust1 = caster:FindAbilityByName("zephyr_gust")
	local gust2 = caster:FindAbilityByName("zephyr_gust2")
	
	if caster:HasScepter() then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_zephyr_typhoon_self_buff", {})
		gust1:EndCooldown()
		gust2:EndCooldown()
	end
end