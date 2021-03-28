# HoH-Swords-and-Stuff
A large item mod for Heroes of Hammerwatch

The item collection is comprised of 123 Items of varring effect.

For Modders, the mod includes some Item Modifiers:
-BasicPerCombo <Adds the current combo counter to character stats>
  -Support for Attack/Spell Power, Physical/Magical Damage, Health/Mana, and Armor/Resistance.
  -'scale' int param to adjust the ratio(Stat:'Scale') of combo counter to stats added (1 Default)
  -'total-cap' int param to set a maximum cap (10 Default)
 
-BasicPerKill <Adds a ratio of kills gained after aquirring the modifier to Health and/or Mana>
  -Support for Health and Mana.
  -'kills' int params to adjust the ratio(Stat:'Kills') of kills to stat gained (100 Default)
  -'health-cap' int param to set max health cap (0 Default)
  -'mana-cap' int param to set max mana cap (0 Default)
  
-DamagePerKill <Adds a scaled amount of kills gained after aquirring the modifer and adds or multiplies damage>
  -Support for Attack/Spell Power, and Physical/Magic Damage and Damage Multiplier.
  -'dmg-per-kill' float param to scale amount of kills required. (0.0005[1:2000] Default)
  -'dmg-' float places a maximum cap (0 Default)
 
