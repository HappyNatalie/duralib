#rng for if item should take damage
execute if predicate duralib:should_take_damage run function duralib:generic/process_custom_event/event/test with storage duralib:temp event_queue[0]