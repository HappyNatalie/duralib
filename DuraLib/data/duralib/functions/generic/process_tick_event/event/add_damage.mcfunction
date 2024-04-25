#fetches the damage amount from the current event's data
execute store result score %addamount% duralib run data get storage duralib:temp event_queue[0].damage_amount
#adds the fetched amount to the current_damage value
scoreboard players operation %current_damage% duralib += %addamount% duralib

