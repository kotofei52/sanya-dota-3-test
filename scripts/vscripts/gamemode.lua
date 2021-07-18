
-- This library allow for easily delayed/timed actions
require('libraries/timers')
-- This library can be used for advancted physics/motion/collision of units.  See PhysicsReadme.txt for more information.
require('libraries/physics')
-- This library can be used for advanced 3D projectile systems.
require('libraries/projectiles')
-- This library can be used for sending panorama notifications to the UIs of players/teams/everyone
require('libraries/notifications')

function COverthrowGameMode:PostLoadPrecache()
  DebugPrint("[BAREBONES] Performing Post-Load precache")    
  --PrecacheItemByNameAsync("item_example_item", function(...) end)
  --PrecacheItemByNameAsync("example_ability", function(...) end)

  --PrecacheUnitByNameAsync("npc_dota_hero_viper", function(...) end)
  --PrecacheUnitByNameAsync("npc_dota_hero_enigma", function(...) end)
	PrecacheItemByNameAsync("item_dummy")
	PrecacheItemByNameAsync("item_glove_of_insanity")
	PrecacheItemByNameAsync("item_glove_of_insanity_active")
	PrecacheItemByNameAsync("item_staff")
	PrecacheItemByNameAsync("item_cleaver")
	PrecacheItemByNameAsync("item_ring_of_draco")
	PrecacheItemByNameAsync("item_ring_of_draco_inactive")
	PrecacheItemByNameAsync("item_ring_of_aqua")
	PrecacheItemByNameAsync("item_ring_of_aqua_inactive")
	PrecacheItemByNameAsync("item_the_one_ring")
	PrecacheItemByNameAsync("item_golden_edge")
	PrecacheItemByNameAsync("item_platinum_edge")
	PrecacheItemByNameAsync("item_dragonbane")
	PrecacheItemByNameAsync("item_spellbender")
	PrecacheItemByNameAsync("item_hood_of_obedience")
	PrecacheItemByNameAsync("item_mask_of_command")
end