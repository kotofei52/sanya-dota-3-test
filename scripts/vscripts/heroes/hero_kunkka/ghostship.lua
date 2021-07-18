--[[
	Author: kritth
	Date: 10.01.2015
	Marks seen only to ally
]]
function ghostship_mark_allies( caster, ability, target )
	local allHeroes = HeroList:GetAllHeroes()
	local delay = ability:GetLevelSpecialValueFor( "tooltip_delay", ability:GetLevel() - 1 )
	local particleName = "particles/units/heroes/hero_kunkka/kunkka_ghostship_marker.vpcf"
	
	for k, v in pairs( allHeroes ) do
		if v:GetPlayerID() and v:GetTeam() == caster:GetTeam() then
			local fxIndex = ParticleManager:CreateParticleForPlayer( particleName, PATTACH_ABSORIGIN, v, PlayerResource:GetPlayer( v:GetPlayerID() ) )
			ParticleManager:SetParticleControl( fxIndex, 0, target )
			
			EmitSoundOnClient( "Ability.pre.Torrent", PlayerResource:GetPlayer( v:GetPlayerID() ) )
			
			-- Destroy particle after delay
			Timers:CreateTimer( delay, function()
					ParticleManager:DestroyParticle( fxIndex, false )
					return nil
				end
			)
		end
	end
end

--[[
	Author: kritth
	Date: 10.01.2015
	Start traversing the ship
]]
function ghostship_start_traverse( keys )
	-- Variables
	local caster = keys.caster
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
	local casterPoint = caster:GetAbsOrigin()
	local targetPoint = keys.target_points[1]
	local spawnDistance = ability:GetLevelSpecialValueFor( "ghostship_distance", ability:GetLevel() - 1 )
	local projectileSpeed = ability:GetLevelSpecialValueFor( "ghostship_speed", ability:GetLevel() - 1 )
	local radius = ability:GetLevelSpecialValueFor( "ghostship_width", ability:GetLevel() - 1 )
	local stunDelay = ability:GetLevelSpecialValueFor( "tooltip_delay", ability:GetLevel() - 1 )
	local stunDuration = ability:GetLevelSpecialValueFor( "stun_duration", ability:GetLevel() - 1 )
	local damage = ability:GetLevelSpecialValueFor( "damage", ability:GetLevel() - 1 )
	local damageType = ability:GetAbilityDamageType()
	local targetBuffTeam = DOTA_UNIT_TARGET_TEAM_BOTH
	local targetImpactTeam = DOTA_UNIT_TARGET_TEAM_ENEMY
	local targetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_MECHANICAL
	local targetFlag = DOTA_UNIT_TARGET_FLAG_NONE
	
	local scepter = caster:HasScepter()
	if scepter then
		stunDuration = ability:GetLevelSpecialValueFor("stun_duration_scepter", ability_level)
		damage = ability:GetLevelSpecialValueFor("damage_scepter", ability_level)
	end
	
	-- Get necessary vectors
	local forwardVec = targetPoint - casterPoint
		forwardVec = forwardVec:Normalized()
	local backwardVec = casterPoint - targetPoint
		backwardVec = backwardVec:Normalized()
	local spawnPoint = casterPoint + ( spawnDistance * backwardVec )
	local impactPoint = casterPoint + ( spawnDistance * forwardVec )
	local velocityVec = Vector( forwardVec.x, forwardVec.y, 0 )
	
	caster.ghostship_crash_pos = impactPoint
	
	-- Show visual effect
	ghostship_mark_allies( caster, ability, impactPoint )
	
	-- Spawn projectiles
	local projectileTable = {
		Ability = ability,
		EffectName = "particles/units/heroes/hero_kunkka/kunkka_ghost_ship.vpcf",
		vSpawnOrigin = spawnPoint,
		fDistance = spawnDistance * 2,
		fStartRadius = radius,
		fEndRadius = radius,
		fExpireTime = GameRules:GetGameTime() + 5,
		Source = caster,
		bHasFrontalCone = false,
		bReplaceExisting = false,
		bProvidesVision = false,
		iUnitTargetTeam = targetBuffTeam,
		iUnitTargetType = targetType,
		vVelocity = velocityVec * projectileSpeed
	}
	ProjectileManager:CreateLinearProjectile( projectileTable )
	
	-- Create timer for crashing
	Timers:CreateTimer( stunDelay, function()
			local units = FindUnitsInRadius(
				caster:GetTeamNumber(), impactPoint, caster, radius, targetImpactTeam,
				targetType, targetFlag, FIND_ANY_ORDER, false
			)
			
			-- Fire sound event
			local dummy = CreateUnitByName( "npc_dummy_blank", impactPoint, false, caster, caster, caster:GetTeamNumber() )
			StartSoundEvent( "Ability.Ghostship.crash", dummy )
			dummy:ForceKill( true )
			
			-- Stun and damage enemies
			for k, v in pairs( units ) do
				if not v:IsMagicImmune() then
					local damageTable = {
						victim = v,
						attacker = caster,
						damage = damage,
						damage_type = damageType
					}
					ApplyDamage( damageTable )
				end
				
				v:AddNewModifier( caster, nil, "modifier_stunned", { duration = stunDuration } )
			end
			
			return nil	-- Delete timer
		end
	)
end

--[[
	Author: kritth
	Date: 10.01.2015
	Register damage to unit
]]
function ghostship_register_damage( keys )
	local target = keys.unit
	local damageTaken = keys.DamageTaken
	if not target.ghostship_damage then
		target.ghostship_damage = 0
	end
	
	target.ghostship_damage = target.ghostship_damage + damageTaken
end

--[[
	Author: kritth
	Date: 10.01.2015
	Remove hp over time
]]
function ghostship_spread_damage( keys )
	-- Init in case never take any damage
	if not keys.target.ghostship_damage then
		keys.target.ghostship_damage = 0
	end

	-- Variables
	local target = keys.target
	local ability = keys.ability
	local damageDuration = ability:GetLevelSpecialValueFor( "damage_duration", ability:GetLevel() - 1 )
	local damageInterval = ability:GetLevelSpecialValueFor( "damage_interval", ability:GetLevel() - 1 )
	local damageCurrentTime = 0.0
	local damagePerInterval = target.ghostship_damage * ( damageInterval / damageDuration )
	local minimumHealth = 1

	-- Overtime debuff
	Timers:CreateTimer( damageInterval, function()
			-- HP Removal
			local targetHealth = target:GetHealth()
			if targetHealth - damagePerInterval <= minimumHealth then
				target:SetHealth( minimumHealth )
			else
				target:SetHealth( targetHealth - damagePerInterval )
			end
			
			-- Update timer
			damageCurrentTime = damageCurrentTime + damageInterval
			
			-- Check closing condition
			if damageCurrentTime >= damageDuration then
				return nil
			else
				return damageInterval
			end
		end
	)
end

function OnABoat( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
	local scepter = caster:HasScepter()

	-- Parameters
	local crash_distance = ability:GetLevelSpecialValueFor("crash_distance", ability_level)
	local ship_speed = ability:GetLevelSpecialValueFor("ghostship_speed", ability_level)
	local modifier_rum = keys.modifier_rum
	
	if caster:GetTeam() == target:GetTeam() then
		ability:ApplyDataDrivenModifier(caster, target, modifier_rum, {})
		return nil
	end
	
	if scepter then
		-- Retrieve crash position and calculate knockback parameters
		local crash_pos = caster.ghostship_crash_pos
		local target_pos2 = target:GetAbsOrigin()
		local knockback_origin = target_pos2 + (target_pos2 - crash_pos):Normalized() * 100
		local distance = (crash_pos - target_pos2):Length2D()
		local duration = distance / ship_speed

		-- Apply the knockback modifier and deal impact damage
		local knockback =
		{	should_stun = 1,
			knockback_duration = duration + 0.67,
			duration = duration + 0.67,
			knockback_distance = distance,
			knockback_height = 0,
			center_x = knockback_origin.x,
			center_y = knockback_origin.y,
			center_z = knockback_origin.z
		}
		target:RemoveModifierByName("modifier_knockback")
		target:AddNewModifier(caster, nil, "modifier_knockback", knockback)
	end
end

function GhostShipRegisterDamage( keys )
	local target = keys.unit
	local ability = keys.ability
	local damage_taken = keys.damage_taken
	local rum_reduce_pct = ability:GetLevelSpecialValueFor("rum_reduce_pct", ability:GetLevel() - 1 ) * (-1) / 100

	if not target.ghostship_damage_prevented then
		target.ghostship_damage_prevented = 0
	end
	
	target.ghostship_damage_prevented = target.ghostship_damage_prevented + damage_taken * rum_reduce_pct / (1 - rum_reduce_pct)
end

function GhostShipDelayedDamage( keys )
	local target = keys.target
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1

	-- Initialize the variable in case the unit took no damage
	if not target.ghostship_damage_prevented then
		target.ghostship_damage_prevented = 0
	end

	-- Parameters
	local damage_interval = ability:GetLevelSpecialValueFor("damage_interval", ability_level)
	local damage_duration = ability:GetLevelSpecialValueFor("buff_duration", ability_level)
	local max_ticks = damage_duration / damage_interval
	local current_ticks = 0
	local damage_per_tick = target.ghostship_damage_prevented / max_ticks
	
	-- Deal the prevented damage over time
	Timers:CreateTimer(damage_interval, function()

		-- Nonlethal HP removal
		local target_hp = target:GetHealth()
		if target_hp - damage_per_tick < 1 then
			target:SetHealth(1)
		else
			target:SetHealth(target_hp - damage_per_tick)
		end
		
		-- Check if all the damage has been dealt, if yes, reset the global variable
		current_ticks = current_ticks + 1
		if current_ticks >= max_ticks then
			target.ghostship_damage_prevented = nil
			return nil
		else
			return damage_interval
		end
	end)
end