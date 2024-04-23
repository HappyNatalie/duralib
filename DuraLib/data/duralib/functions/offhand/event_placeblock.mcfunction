#revokes advancements
advancement revoke @s only duralib:offhand/placeblock
#gets item data
function duralib:offhand/getdata
execute store result score %amount% duralib run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".duralib.damage_types.place_block.amount
#attempts to damage item
function duralib:lib/unbreakingrandomizer with entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".duralib
#sets item durability to new durability
execute store result storage dmglib:temp newdmg int 1 run scoreboard players get %damage% duralib
function duralib:offhand/modify with storage dmglib:temp

#checks if item should be broken
execute if score %damage% duralib < %max_damage% duralib run item modify entity @s weapon.offhand [{"function":"minecraft:set_custom_data","tag":"{duralib:{broken:0b}}"}]
execute if score %damage% duralib > %max_damage% duralib run function duralib:offhand/break/event
