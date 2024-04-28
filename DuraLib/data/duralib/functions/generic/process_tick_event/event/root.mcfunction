#stores timers into scores
execute store result score %frequency% duralib run data get storage duralib:temp event_queue[0].frequency
execute store result score %timer% duralib run data get storage duralib:temp event_queue[0].timer
#incriments timer
scoreboard players add %timer% duralib 1
#checks if timer is reqdy
execute if score %timer% duralib >= %frequency% duralib run function duralib:generic/process_tick_event/event/split
#updates the timer in the event_queue
execute store result storage duralib:temp event_queue[0].timer int 1 run scoreboard players get %timer% duralib
#caches the new version in the return queue
data modify storage duralib:temp queue_return append from storage duralib:temp event_queue[0]
#clears list element when finished
data remove storage duralib:temp event_queue[0]
#loops if there is more events to process
execute if data storage duralib:temp event_queue[0] run function duralib:generic/process_tick_event/event/root

