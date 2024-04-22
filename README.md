# Durabiltiy Library
I would like to start out by saying this might not be the most optimized way on the planet to do this and if anyone can help improve it please feel free

In the most recent update of minecraft (1.20.5) there is the ability to add a custom amount of durability but not the ability to customize how that durability gets consumed. The goal of this datapack is to add more customizability to the way durability is consumed.
For convenience this datapack requires no additional functions or input beyond the setting of it's peramiters in an item's custom data though there is a function to dynamically damage an item.

All data for this pack is stored in the `duralib:{}` data tag.
Tags labeled with a ! are required for the system to work.
````
> duralib
  > damage_types
    > place_block
      > enabled:<true/false>
      > amount:<int>
    > break_block
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
    > timed
      > enabled:<true/false>
      > rate:<int>
      > amount:<int>
  > slots
    > mainhand:<true/false>
    > offhand:<true/false>
    > helmet:<true/false>
    > chestplate:<true/false>
    > leggings:<true/false>
    > boots:<true/false>
  > ignores_unbreaking:<true/false> !
  > ignore_chance:<float> !
  > destroy_on_break:<true/false> !
  > break_item:<string (valid minecraft item id)> !
  > broken:<true/false>
````




Example of correctly made item (true/false convert into 1b/0b when item is given)
````mcfunction
give @p diamond[max_stack_size=1,max_damage=32,custom_data={duralib:{damage_types:{player_attack_enemy:{enabled:true,amount:1}},slots:{mainhand:true},ignores_unbreaking:false,ignore_chance:0.0f,destory_on_break:true,break_item:"minecraft:diamond"}}] 1
```` 
