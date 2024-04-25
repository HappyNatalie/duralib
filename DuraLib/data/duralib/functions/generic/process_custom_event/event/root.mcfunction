#check if event id matches
execute store result score %custom_match% duralib run data modify storage duralib:temp event_queue[0].event_id set from storage duralib:temp searching_event
#resume function if it does
execute if score %custom_match% duralib matches 0 run function duralib:generic/process_custom_event/event/real_root
#clears list element when finished
data remove storage duralib:temp event_queue[0]
#loops if there is more events to process
execute if data storage duralib:temp event_queue[0] run function duralib:generic/process_custom_event/event/root

