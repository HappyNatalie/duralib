 # Durabiltiy Library
I would like to start out by saying this might not be the most optimized way on the planet to do this I just threw this together ASAP to use for another project and figured I would put it up.
It isn't the most optimal thing on the planet because im an idiot but I got it to where I can't tell if its on or not by the mspt on my crap computer so it's prolly fine.

This pack works fully off of item data there is no need to modify functions or do anything of the sort just put the zip file in your datapacks folder and all the custom data tags will work with no extra messing around.

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

Generic function
Running either of these functions for a player triggers their `generic` `damage_type`. This is so you can easily damage items (for instance if you have a right click detector that you want to take durability).
````mcfunction
function duralib:mainhand/event_generic
function duralib:offhand/event_generic
````
Here is a example of a correctly made item (true/false convert into 1b/0b when item is given)
````mcfunction
give @p diamond[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{player_attack_enemy:{enabled:true,amount:1}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destroy_on_break:true,break_item:"minecraft:diamond"}}] 1
````

