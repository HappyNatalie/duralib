#clears return queue
data remove storage duralib:temp queue_return
#checks if there is an event to process (redundency to avoid empty but enabled event types from breaking items)
execute if data storage duralib:temp event_queue[0] run function duralib:generic/process_event/event/root