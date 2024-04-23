# Durabiltiy Library
I would like to start out by saying this might not be the most optimized way on the planet to do this I just threw this together ASAP to use for another project and figured I would put it up. I am not experienced at making library mods so please don't judge too hard on the poor optimization or weird implimentation. Feel freeto improve on this as there is def room to improve.

Future Updates Planened : 
Block Broken Damage Type
Armor Support
The ability to make it so tick functions work at a consistent rate rather than fully depending on rng.
Addition of more support for automated repair of items.

In the most recent update of minecraft (1.20.5) there is the ability to add a custom amount of durability but not the ability to customize how that durability gets consumed. The goal of this datapack is to add more customizability to the way durability is consumed.
For convenience this datapack requires no additional functions or input beyond the setting of it's peramiters in an item's custom data though there is a function to dynamically damage an item.

All data for this pack is stored in the `duralib:{}` data tag.
Tags labeled with a ! are required for the system to work.
Tags labled with a ? are not writeable and are just used for data storage.
````
> duralib
  > damage_types (PACK DOES NOT SUPPORT 2 OF THE SAME DAMAGE TYPE ON 1 ITEM)
    > place_block
      > enabled:<true/false>
      > amount:<int>
    > player_attack_enemy
      > enabled:<true/false>
      > amount:<int>
    > enemy_attack_player
      > enabled:<true/false>
      > amount:<int>
    > killed_entity
      > enabled:<true/false>
      > amount:<int>
    > generic
      > amount:<int>
    > tick
      > enabled:<true/false>
      > amount:<int>
      > condition:<tag> !
        > "always"
        > "swimming"
        > "walking"
        > "crouching"
        > "using_elytra"
  > slots
    > mainhand:<true/false>
    > offhand:<true/false>
  > ignores_unbreaking:<true/false> !
  > ignore_chance:<float> !
  > destroy_on_break:<true/false> !
  > break_item:<string (valid minecraft item id)> !
  > broken:<true/false> ?
````
You can add your own timed condition by giving the player a tag called `duralib.tracker.<custom_name>` then the custom name will be your condition name.



A few examples of correctly made item (true/false convert into 1b/0b when item is given)
````mcfunction
give @p diamond[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{player_attack_enemy:{enabled:true,amount:1}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destroy_on_break:true,break_item:"minecraft:diamond"}}] 1
give @p stone[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{enemy_attack_player:{enabled:true,amount:1}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destroy_on_break:true,break_item:"minecraft:diamond"}}] 1
give @p gold_ingot[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{place_block:{enabled:true,amount:1}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destroy_on_break:true,break_item:"minecraft:diamond"}}] 1
give @p blaze_rod[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{killed_entity:{enabled:true,amount:1}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destroy_on_break:true,break_item:"minecraft:diamond"}}] 1
give @p cobblestone[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{tick:{enabled:true,amount:1,condition:"walking"}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destroy_on_break:true,break_item:"minecraft:diamond"}}] 1
```` 


Current Progress : All functionality is working for the mainhand slot I just need to apply the same code to the other slots and the library is done.
