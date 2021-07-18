function item_cheese_datadriven_on_spell_start(keys)
	keys.caster:Heal(keys.HealthRestore, keys.caster)
	keys.caster:GiveMana(keys.ManaRestore)
end