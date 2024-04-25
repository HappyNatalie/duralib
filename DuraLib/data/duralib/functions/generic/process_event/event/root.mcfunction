#rng for if item should take damage
execute if predicate duralib:should_take_damage run function duralib:generic/process_event/event/test with storage duralib:temp event_queue[0]
#clears list element when finished
data remove storage duralib:temp event_queue[0]
#loops if there is more events to process
execute if data storage duralib:temp event_queue[0] run function duralib:generic/process_event/event/root

