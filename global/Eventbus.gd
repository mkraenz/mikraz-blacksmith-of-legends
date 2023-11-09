extends Node

signal add_to_inventory(resource_name: String, amount: int)
signal production_tick  # production buildings connect to this signal and reduce their order's duration_in_ticks counter by 1

# menus and persistence
signal new_game_pressed
signal load_game_pressed
signal load_most_recent_game_pressed
signal resume_game_pressed
signal quit_to_title_pressed
signal save_game_pressed
signal game_saved_successfully
signal toggle_crafting_menu(for_building: String, workshop_node_path: String)  ## node path is the absolute path to the node that is being processed. used for sending the order back to that workshop
signal close_crafting_menu
signal ordered_at_workshop(recipe: Dictionary, batches: float, workshop_node_path: String)
signal toggle_building_menu
