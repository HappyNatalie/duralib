#checks if there is an event to process (redundency to avoid empty but enabled event types from breaking items)
data remove storage duralib:temp queue_return
execute if data storage duralib:temp event_queue[0] run function duralib:generic/process_tick_event/event/root