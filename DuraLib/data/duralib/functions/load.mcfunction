scoreboard objectives add duralib dummy
scoreboard objectives add duralib.static dummy
execute unless score %statics_created% duralib.static matches -1 run function duralib:createstatics