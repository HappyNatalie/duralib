#stores the id
$data modify storage duralib:temp searching_event set value "$(trigger_event_id)"

execute if predicate duralib:has_duralib run function duralib:mainhand/custom/event
