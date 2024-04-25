````markdown
- duralib {}
	- enabled <bool> !
	- active_slots {} !
		- mainhand <bool>
		- offhand <bool>
	- break_particle_item_id <string> !
	- destroy_on_item_break <bool> !
	- damage_events {}
		- placed_block {}
			- enabled <bool> !
			- damage_events [{}]
				- damage_chance <float> !
				- damage_amount <int> ! 
				- ignores_unbreaking <bool> !
				- condition <string> !
				- max_damage <int> !
		- player_attacked_enemy {}
			- enabled <bool> !
			- damage_events [{}]
				- damage_chance <float> !
				- damage_amount <int> ! 
				- ignores_unbreaking <bool> !
				- condition <string> !
				- max_damage <int> !
		- enemy_attacked_player {}
			- enabled <bool> !
			- damage_events [{}]
				- damage_chance <float> !
						- damage_amount <int> ! 
						- ignores_unbreaking <bool> !
				- condition <string> !
				- max_damage <int> !
		- killed_enemy {}
			- enabled <bool>
			- damage_events [{}]
				- damage_chance <float> !
				- damage_amount <int> ! 
				- ignores_unbreaking <bool> !
				- condition <string> !
				- max_damage <int> !
		- tick {}
			- enabled <bool>
			- damage_events [{}]
				- damage_chance <float> !
				- damage_amount <int> ! 
				- ignores_unbreaking <bool> !
				- condition <string> !
						- max_damage <int> !
				- frequency <int> !
				- timer <int> ?
 		- custom {}
			- enabled <bool>
			- damage_events [{}]
				- damage_chance <float> !
				- damage_amount <int> ! 
				- ignores_unbreaking <bool> !
				- condition <string> !
				- max_damage <int> !
				- eventid <string> !
	- is_broken <bool> ?
````
