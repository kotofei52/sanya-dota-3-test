function Return(keys)
	keys.caster:EmitSound("DOTA_Item.MagicStick.Activate")
	
	keys.caster:Heal(15, keys.caster)
	keys.caster:GiveMana(15)
end