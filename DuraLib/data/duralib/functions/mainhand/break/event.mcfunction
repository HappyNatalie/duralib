execute if score %break% duralib matches 1 run function duralib:mainhand/break/break_item with entity @s SelectedItem.components."minecraft:custom_data".duralib

item modify entity @s weapon.mainhand [{"function":"minecraft:set_custom_data","tag":"{duralib:{broken:1b}}"},{"function":"minecraft:set_damage","damage":0}]
