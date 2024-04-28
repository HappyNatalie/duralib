#revoke advancement
advancement revoke @s only duralib:mainhand/player_attack_enemy
#tag player for item copying
tag @s add duralib.player
#actual function
execute summon item_display run function duralib:mainhand/player_attack_enemy/as_temp_entity
#reset player tag
tag @s remove duralib.player