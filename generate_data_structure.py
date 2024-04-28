import json

def prompt_damage_event(event_name):
    enabled = input(f"Is damage event '{event_name}' enabled? (True/False): ").lower() == 'true'
    if not enabled:
        return {"enabled": False}
    else:
        damage_events = []
        while True:
            damage_event = {
                "damage_chance": int(input(f"Enter damage chance for '{event_name}' event: ")),
                "damage_amount": int(input(f"Enter damage amount for '{event_name}' event: ")),
                "ignores_unbreaking": input(f"Ignore unbreaking for '{event_name}' event? (True/False): ").lower() == 'true',
                "condition": input(f"Enter condition for '{event_name}' event: ")
            }
            damage_events.append(damage_event)
            add_more = input(f"Add another damage event for '{event_name}' event? (True/False): ").lower() == 'true'
            if not add_more:
                break
        return {
            "enabled": True,
            "damage_events": damage_events
        }

def prompt_damage_event_tick(event_name):
    enabled = input(f"Is damage event '{event_name}' enabled? (True/False): ").lower() == 'true'
    if not enabled:
        return {"enabled": False}
    else:
        damage_events_tick = []
        while True:
            damage_event_tick = {
                "damage_chance": int(input(f"Enter damage chance for '{event_name}' event: ")),
                "damage_amount": int(input(f"Enter damage amount for '{event_name}' event: ")),
                "ignores_unbreaking": input(f"Ignore unbreaking for '{event_name}' event? (True/False): ").lower() == 'true',
                "condition": input(f"Enter condition for '{event_name}' event: "),
                "frequency": int(input(f"Enter frequency for '{event_name}' event: "))
            }
            damage_events_tick.append(damage_event_tick)
            add_more = input(f"Add another damage event for '{event_name}' event? (True/False): ").lower() == 'true'
            if not add_more:
                break
        return {
            "enabled": True,
            "damage_events": damage_events_tick
        }

def prompt_damage_event_custom(event_name):
    enabled = input(f"Is damage event '{event_name}' enabled? (True/False): ").lower() == 'true'
    if not enabled:
        return {"enabled": False}
    else:
        damage_events_custom = []
        while True:
            damage_event_custom = {
                "damage_chance": int(input(f"Enter damage chance for '{event_name}' event: ")),
                "damage_amount": int(input(f"Enter damage amount for '{event_name}' event: ")),
                "ignores_unbreaking": input(f"Ignore unbreaking for '{event_name}' event? (True/False): ").lower() == 'true',
                "condition": input(f"Enter condition for '{event_name}' event: "),
                "event_id": input(f"Enter event_id for '{event_name}' event: ")
            }
            damage_events_custom.append(damage_event_custom)
            add_more = input(f"Add another damage event for '{event_name}' event? (True/False): ").lower() == 'true'
            if not add_more:
                break
        return {
            "enabled": True,
            "damage_events": damage_events_custom
        }

def generate_minecraft_data_structure():
    data = {
        "duralib": {
            "enabled": input("Is duralib enabled? (True/False): ").lower() == 'true',
            "active_slots": {
                "mainhand": input("Is mainhand slot active? (True/False): ").lower() == 'true',
                "offhand": input("Is offhand slot active? (True/False): ").lower() == 'true'
            },
            "break_particle_item_id": input("Enter break particle item ID: "),
            "destroy_on_item_break": input("Destroy item on durability running out? (True/False): ").lower() == 'true',
            "max_damage": int(input("Enter maximum damage: ")),
            "damage_events": {
                "placed_block": prompt_damage_event("placed_block"),
                "player_attacked_enemy": prompt_damage_event("player_attacked_enemy"),
                "enemy_attacked_player": prompt_damage_event("enemy_attacked_player"),
                "killed_enemy": prompt_damage_event("killed_enemy"),
                "tick": prompt_damage_event_tick("tick"),
                "custom": prompt_damage_event_custom("custom")
            },
            "is_broken": False
        }
    }
    return data

if __name__ == "__main__":
    minecraft_data = generate_minecraft_data_structure()
    json_data = json.dumps(minecraft_data, indent=4)
    print("\"minecraft:custom_data\":",json_data)
