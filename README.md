# Durability Library
This library helps you manage durability of your items while being 100% data based and not requiring any tweaking of functions on your part.



# Data Structure
````markdown
- duralib {}
	- enabled <bool> !
	- active_slots {} !
		- mainhand <bool>
		- offhand <bool>
	- break_particle_item_id <string> !
	- destroy_on_item_break <bool> !
	- max_damage <int>
	- damage_events {}
		- placed_block {}
			- enabled <bool> !
			- damage_events [{}]
				- damage_chance <int> !
				- damage_amount <int> ! 
				- ignores_unbreaking <bool> !
				- condition <string> !
		- player_attacked_enemy {}
			- enabled <bool> !
			- damage_events [{}]
				- damage_chance <int> !
				- damage_amount <int> ! 
				- ignores_unbreaking <bool> !
				- condition <string> !
		- enemy_attacked_player {}
			- enabled <bool> !
			- damage_events [{}]
				- damage_chance <int> !
				- damage_amount <int> ! 
				- ignores_unbreaking <bool> !
				- condition <string> !
		- killed_enemy {}
			- enabled <bool>
			- damage_events [{}]
				- damage_chance <int> !
				- damage_amount <int> ! 
				- ignores_unbreaking <bool> !
				- condition <string> !
		- tick {}
			- enabled <bool>
			- damage_events [{}]
				- damage_chance <int> !
				- damage_amount <int> ! 
				- ignores_unbreaking <bool> !
				- condition <string> !
				- frequency <int> !
				- timer <int> ?
        - custom {}
			- enabled <bool>
			- damage_events [{}]
				- damage_chance <int> !
				- damage_amount <int> ! 
				- ignores_unbreaking <bool> !
				- condition <string> !
				- event_id <string> !
	- is_broken <bool> ?
````
Guide to all data fields

Tags with a ! are required for their dataset to work.
Tags with a ? are read only and exist only for developers to be able to read data from the system.

>duralib: The general field where all data for this pack is stored.

>duralib.enabled: Controls if the durability system is on or off. (This mainly exists to make it easier for datapacks to toggle the system freely on existing items via item modifiers)

>duralib.active_slots.(Any value that can go in this data set): Controls what slots the durability system will recognize the item as being currently equipped in.

>duralib.break_particle_item_id: The string of the id of any minecraft item you want to act as the particle when the item breaks.

>duralib.destroy_on_item_break: If the item will be destroyed on reaching 0 durability. (Pack prevents going into negitive durability values)

>duralib.is_broken: This is a is a readable tag that tells if an item with destroy_on_item_break is broken (at 0 durability) or not.

>duralib.max_damage: The max damage of an item needs to be set in the duralib settings alongside the item component. They should be equal to each other to avoid cosmetic desync of the durability meter.

>duralib.damage_events: Damage events are things that can happen in game to damage the item.

Damage event types
>duralib.damage_events.placed_block: Triggers when the player places a block.

>duralib.damage_events.player_attacked_enemy: Triggers whenever the player attacks any entity.

>duralib.damage_events.enemy_attacked_player: Triggers whenever the player is attacked by any entity.

>duralib.damage_events.killed_enemy: Triggers whenever the player kills an entity.

>duralib.damage_events.tick: Triggers every tick.

>duralib.damage_events.custom: Triggers when called with a function.

Damage event data tags
>duralib.damage_events.(Any damage event type).enabled: This bool determines if the damage events in the type will be checked (This exists for optimization reasons)


>duralib.damage_events.(Any damage event type)[{}].damage_chance: This is the X/1000 chance that the damage event will occur. For instance a damage event with a damage_chance of 250 has a 25% chance to occur. Any number 1000 or over will have a 100% chance. Any

>negitive number will have a 0% chance.

>duralib.damage_events.(Any damage event type)[{}].damage_amount: This is the amount of damage this damage event will inflict.

>duralib.damage_events.(Any damage event type)[{}].ignores_unbreaking: This determines if the event will ignore unbreaking when calculating if the item should take damage from the current damage event.

>duralib.damage_events.(Any damage event type)[{}].condition: This is the condition required for the damage event to occur it will always fail if this is not set. The default condition is "always" and will never be false. In order to create a condition simply
>make a tag called duralib.condition.<my_condition> then that tag will act as a condition under the name "my_condition". There will be a pack coming in the near future with a set of pre made conditions for convenience sake. These are not being included in the >main pack as they will be more expensive then the main pack to run and I do not want to loose optimization for said feature unless you are actually loosing it.

Tick exlusive tags

>duralib.damage_events.tick[{}].frequency: This is how often in ticks the damage event will occur. (For instance a frequency of 10 will occur on every tenth tick) If you want an event to occur every tick set this to -1 as it is hardcoded to skip the counting process if it is set to -1 for optimization reasons.

>duralib.damage_events.tick[{}].timer: This is a readable tag that tracks how long until the next activation if frequency is set to a number that is not -1.

Custom Events (Designed for more advanced users than other features)

>duralib.damage_events.custom[{}].event_id: This id helps packs that add custom damage events control what damage events they activate at any given time.
>In order to call an event by ID all you have to do is set a data storage to have the `trigger_event_id` data with the same string as your event id.
Example: Lets say I wanted to call my custom event with the event_id `"event_1"`. All I need to do is store that string in a storage tag and run the function with it.
````mcfunction
data modify storage testing:temp event set value "event_1"
function duralib:customs/mainhand with storage testing:temp
````
Custom damage events still are required to have the rest of the data including enabling the custom catagory and setting active slots but other than that you can do basically anything.
To avoid conflicts with other datapacks using this library it is HEAVILY suggested to store any custom event names under a namespace (For instance the one earlier would be `mydatapack:event_1`)

This library is fully data driven and designed to just be dropped into a datapack folder alongside any datapack that uses it. With the exceptions of custom conditions and damage events this doesn't require any coding or tweaking on your part to use. Contact me at @happynatalie on discord with any questions about use or syntax.
