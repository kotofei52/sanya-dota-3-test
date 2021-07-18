function Return(keys)
	keys.caster:EmitSound("DOTA_Item.MagicStick.Activate")
	
	keys.caster:Heal(30, keys.caster)
	keys.caster:GiveMana(30)
end