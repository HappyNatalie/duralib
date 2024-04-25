#stores the id
$data modify storage duralib:temp searching_event set value "$(trigger_event_id)"

execute if entity @s[nbt={SelectedItem:{components: {"minecraft:custom_data":{duralib: {damage_events: {custom: {enabled: 1b}},active_slots: {mainhand: 1b},enabled: 1b}}}}}] run function duralib:mainhand/custom/event
