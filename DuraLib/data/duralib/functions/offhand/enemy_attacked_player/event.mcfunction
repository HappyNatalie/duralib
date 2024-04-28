#revoke advancement
advancement revoke @s only duralib:offhand/enemy_attacked_player
#tag player for item copying
tag @s add duralib.player
#actual function
execute summon item_display run function duralib:offhand/enemy_attacked_player/as_temp_entity
#reset player tag
tag @s remove duralib.player
