#revokes advancements
advancement revoke @s only duralib:mainhand/timed
function duralib:mainhand/event_timed_test with entity @s SelectedItem.components."minecraft:custom_data".duralib.damage_types.tick
