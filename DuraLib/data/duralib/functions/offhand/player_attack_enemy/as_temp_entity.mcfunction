#tags item display
tag @s add duralib.temp_entity
#copy item from player for more effecient nbt reading and writing
item replace entity @s contents from entity @a[distance=..1,tag=duralib.player,limit=1] weapon.offhand
#stores commonly refrenced data in scores
execute store result score %current_damage% duralib run data get entity @s item.components."minecraft:damage"
execute store result score %max_damage% duralib run data get entity @s item.components."minecraft:custom_data".duralib.max_damage
execute store result score %destroy_bool% duralib run data get entity @s item.components."minecraft:custom_data".duralib.destroy_on_item_break
execute store result score %unbreaking_level% duralib run data get entity @s item.components."minecraft:enchantments".levels."minecraft:unbreaking"
#stores data in storage for effeciently going through the list
data modify storage duralib:temp event_queue set from entity @s item.components."minecraft:custom_data".duralib.damage_events.player_attacked_enemy.damage_events
#modifies data scores according to list
execute if data storage duralib:temp event_queue[0] run function duralib:generic/process_event/execute_list
#tests if item is broken
execute if score %current_damage% duralib < %max_damage% duralib run data modify entity @s item.components."minecraft:custom_data".duralib.is_broken set value 0b
execute if score %current_damage% duralib >= %max_damage% duralib run function duralib:offhand/item_below_durability
#sets damage in item data
execute store result entity @s item.components."minecraft:damage" int 1 run scoreboard players get %current_damage% duralib
item replace entity @a[distance=..1,tag=duralib.player,limit=1] weapon.offhand from entity @s contents 
#terminates temp entity
kill @s


