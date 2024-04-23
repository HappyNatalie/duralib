#fetches data from selected item
execute store result score %max_damage% duralib run data get entity @s Inventory[{Slot:-106b}].components."minecraft:max_damage"
scoreboard players operation %goal% duralib = %max_damage% duralib
scoreboard players set %damage% duralib 0
execute store result score %damage% duralib run data get entity @s Inventory[{Slot:-106b}].components."minecraft:damage"
execute store result score %unbreaking% duralib run data get entity @s Inventory[{Slot:-106b}].components."minecraft:enchantments".levels."minecraft:unbreaking"
execute store result score %break% duralib run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".duralib.destroy_on_break