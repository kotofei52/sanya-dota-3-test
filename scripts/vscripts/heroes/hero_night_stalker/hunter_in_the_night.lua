--[[Author: Pizzalol
	Date: 11.01.2015.
	Checks if it is night time to see if it should apply the night modifier
	If it is day then it removes it if the caster has the night modifier]]
function HunterInTheNight( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier
	local modifier2 = keys.modifier2
	local scepter = caster:HasScepter()

	if not GameRules:IsDaytime() and not scepter then
		ability:ApplyDataDrivenModifier(caster, caster, modifier, {})
		if caster:HasModifier(modifier2) then caster:RemoveModifierByName(modifier2) end
	elseif not GameRules:IsDaytime() and scepter then
		ability:ApplyDataDrivenModifier(caster, caster, modifier2, {})
		if caster:HasModifier(modifier) then caster:RemoveModifierByName(modifier) end
	else
		if caster:HasModifier(modifier) then caster:RemoveModifierByName(modifier) end
		if caster:HasModifier(modifier2) then caster:RemoveModifierByName(modifier2) end
	end
end

function FearoftheLight( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier = keys.modifier

	if GameRules:IsDaytime() then
		ability:ApplyDataDrivenModifier(caster, caster, modifier, {})
	else
		if caster:HasModifier(modifier) then caster:RemoveModifierByName(modifier) end
	end
end