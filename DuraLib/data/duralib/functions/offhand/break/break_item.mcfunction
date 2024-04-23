playsound minecraft:entity.item.break player @a ~ ~ ~ 1
$particle item{item:"$(break_item)"} ~ ~1 ~ 0.05 0.05 0.05 0.1 15 normal
item replace entity @s weapon.offhand with air
