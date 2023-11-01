extends Node

var inventory := GInventory

## following https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html except for handling of autoload variables aka globals


func save_game(tree: SceneTree):
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var save_nodes = tree.get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		var node_data = node.call("save")
		var json_string = JSON.stringify(node_data)
		save_file.store_line(json_string)

	for global_variable in [inventory]:
		# for global_variable in [inventory]:
		var node_data = global_variable.call("save")
		var json_string = JSON.stringify(node_data)
		save_file.store_line(json_string)


## Note: This can be called from anywhere inside the tree. This function
## is path independent.
## get_tree_node is used for injecting `get_node` from a node within
## the tree into this function. Not doing so will cause an error.
## Alternative would be to have like a /root/Main/Scripts/Persistence node with this script,
## so that get_tree() and get_node() have the tree context set.
func load_game(tree: SceneTree, get_tree_node: Callable):
	if not FileAccess.file_exists("user://savegame.save"):
		return  # Error! We don't have a save to load.

	# We need to revert the game state so we're not cloning objects
	# during loading. This will vary wildly depending on the needs of a
	# project, so take care with this step.
	# For our example, we will accomplish this by deleting saveable objects.
	var save_nodes = tree.get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print(
				"JSON Parse Error: ",
				json.get_error_message(),
				" in ",
				json_string,
				" at line ",
				json.get_error_line()
			)
			continue

		var node_data = json.get_data()

		print(node_data)
		if node_data.get("is_autoload"):
			if node_data["autoload_name"] == "GInventory":
				inventory.inventory = node_data["inventory"]
		else:
			# Firstly, we need to create the object and add it to the tree and set its position.
			var new_object = load(node_data["filename"]).instantiate()
			get_tree_node.call(node_data["parent"]).add_child(new_object)
			new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])

			# Now we set the remaining variables.
			for i in node_data.keys():
				if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
					continue
				new_object.set(i, node_data[i])