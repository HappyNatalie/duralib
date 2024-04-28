scoreboard players operation %current_damage% duralib = %max_damage% duralib
data modify entity @s item.components."minecraft:custom_data".duralib.is_broken set value 1b
execute if score %destroy_bool% duralib matches 1 run function duralib:offhand/break_item with entity @s item.components."minecraft:custom_data".duralib