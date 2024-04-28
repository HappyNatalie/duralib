#revoke advancement
advancement revoke @s only duralib:offhand/player_killed_enemy
#tag player for item copying
tag @s add duralib.player
#actual function
execute summon item_display run function duralib:offhand/player_killed_enemy/as_temp_entity
#reset player tag
tag @s remove duralib.player