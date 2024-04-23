#elytra detection
tag @s remove duralib.tracking.using_elytra
execute store result score @s duralib.trackers.aviate if score @s duralib.trackers.aviate matches 2.. run tag @s add duralib.tracking.using_elytra
#sneak detection          
tag @s remove duralib.tracking.crouching
execute store result score @s duralib.trackers.sneaking if score @s duralib.trackers.sneaking matches 2.. run tag @s add duralib.tracking.crouching
#walk detection          
tag @s remove duralib.tracking.walking
execute store result score @s duralib.trackers.walk if score @s duralib.trackers.walk matches 2.. run tag @s add duralib.tracking.walking
execute store result score @s duralib.trackers.walk1 if score @s duralib.trackers.walk1 matches 2.. run tag @s add duralib.tracking.walking
execute store result score @s duralib.trackers.walk2 if score @s duralib.trackers.walk2 matches 2.. run tag @s add duralib.tracking.walking
execute store result score @s duralib.trackers.walk3 if score @s duralib.trackers.walk3 matches 2.. run tag @s add duralib.tracking.walking
#running detection
tag @s remove duralib.tracking.swimming
execute store result score @s duralib.trackers.swim if score @s duralib.trackers.swim matches 2.. run tag @s add duralib.tracking.swimming
execute store result score @s duralib.trackers.swim2 if score @s duralib.trackers.swim2 matches 2.. run tag @s add duralib.tracking.swimming
execute store result score @s duralib.trackers.swim3 if score @s duralib.trackers.swim3 matches 2.. run tag @s add duralib.tracking.swimming

execute if entity @s[tag=duralib.tracking.using_elytra] run tag @s remove duralib.tracking.walking
execute if entity @s[tag=duralib.tracking.swimming] run tag @s remove duralib.tracking.walking

tag @s add duralib.tracking.no_condition