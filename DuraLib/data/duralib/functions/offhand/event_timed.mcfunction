#revokes advancements
advancement revoke @s only duralib:offhand/timed
function duralib:offhand/event_timed_test with entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".duralib.damage_types.tick
