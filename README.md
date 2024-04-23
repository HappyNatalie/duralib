 # Durabiltiy Library
I would like to start out by saying this might not be the most optimized way on the planet to do this I just threw this together ASAP to use for another project and figured I would put it up. I am not experienced at making library mods so please don't judge too hard on the poor optimization or weird implimentation. Feel freeto improve on this as there is def room to improve.

Future Updates Planened :
``Block Broken Damage Type.``
``Armor Support.``
``The ability to make it so tick functions work at a consistent rate rather than fully depending on rng.``
``Addition of more support for automated repair of items.``
``Algorythm for unbreaking instead of hard coding to support levels above 10 (sorta pointless but I still wanna)`` 
``Support for the unbreakable tag``
``A tag that allows item to be damaged even when it is held by a creative player (This is disabled by defualt)``
``Generator for automatically assembling duralib tags``

In the most recent update of minecraft (1.20.5) there is the ability to add a custom amount of durability but not the ability to customize how that durability gets consumed. The goal of this datapack is to add more customizability to the way durability is consumed.
For convenience this datapack requires no additional functions or input beyond the setting of it's peramiters in an item's custom data though there is a function to dynamically damage an item.

All data for this pack is stored in the `duralib:{}` data tag.
Tags labeled with a ! are required for the system to work.
Tags labled with a ? are not writeable and are just used for data storage.

````
> duralib (namespace for all data related to this library other than the vanilla damage and max_damage components)
  > damage_types (PACK DOES NOT SUPPORT 2 OF THE SAME DAMAGE TYPE ON 1 ITEM)
    > place_block (triggers whenever you place a block)
      > enabled:<true/false> (if this damage type can be triggered)
      > amount:<int> (how much damage is dealt to the item when this damage type is triggered)
    > player_attack_enemy (triggers whenever you attack an enemy)
      > enabled:<true/false> (if this damage type can be triggered)
      > amount:<int> (how much damage is dealt to the item when this damage type is triggered)
    > enemy_attack_player (triggers whenever you take damage rom something)
      > enabled:<true/false> (if this damage type can be triggered)
      > amount:<int> (how much damage is dealt to the item when this damage type is triggered)
    > killed_entity (triggers whenever you kill something)
      > enabled:<true/false> (if this damage type can be triggered)
      > amount:<int> (how much damage is dealt to the item when this damage type is triggered)
    > generic (for use in functions)
      > amount:<int>  (how much damage is dealt to the item when this damage type is triggered)
    > tick (triggers every tick)
      > enabled:<true/false> (if this damage type can be triggered)
      > amount:<int> (how much damage is dealt to the item when this damage type is triggered)
      > condition:<tag> !  (the condition required for the durability to change)
        > "always" (always on)
        > "swimming" (only when your moving it water)
        > "walking" (only when your moving while not flying or in water)
        > "crouching" (only while holding crouch)
        > "using_elytra" (only while flying with an elytra)
  > slots (determines what slots the item is considered as being used when its in)
    > mainhand:<true/false>
    > offhand:<true/false>
  > ignores_unbreaking:<true/false> ! (if the item ignores the unbreaking enchantment)
  > ignore_chance:<float> ! (the percent change to not reduce the damage)
  > destroy_on_break:<true/false> ! (if the item is destroyed when it reaches 0 durability)
  > break_item:<string (valid minecraft item id)> ! (what particle shows when the item breaks)
  > broken:<true/false> ? (is set to true when destroy_on_break is set to false and item durability is at 0)
````
Custom condition creation.
Creating a custom condition is very simple just give the player the tag `duralib.tracking.<custom condition name>` when they meet your requirements.
For instance to create the custom condition `"example"` I would give the player the `duralib.tracking.example` tag when I want it to be true and remove it when I want it to be false/


A few examples of correctly made item (true/false convert into 1b/0b when item is given)
````mcfunction
give @p diamond[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{player_attack_enemy:{enabled:true,amount:1}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destroy_on_break:true,break_item:"minecraft:diamond"}}] 1
give @p stone[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{enemy_attack_player:{enabled:true,amount:1}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destroy_on_break:true,break_item:"minecraft:diamond"}}] 1
give @p gold_ingot[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{place_block:{enabled:true,amount:1}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destroy_on_break:true,break_item:"minecraft:diamond"}}] 1
give @p blaze_rod[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{killed_entity:{enabled:true,amount:1}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destroy_on_break:true,break_item:"minecraft:diamond"}}] 1
give @p cobblestone[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{tick:{enabled:true,amount:1,condition:"walking"}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destroy_on_break:true,break_item:"minecraft:diamond"}}] 1
```` 


Current Progress : All functionality is working for the mainhand slot I just need to apply the same code to the other slots and the library is done.
