#tests if the player has a spesific condition
$execute if entity @a[distance=..1,tag=duralib.player,limit=1,tag=duralib.condition.$(condition)] run function duralib:generic/process_tick_event/event/add_damage
