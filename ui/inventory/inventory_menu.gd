extends Control

var ginventory := GInventory

@onready var item_list = $M/ScrollContainer/ItemList


func _ready():
	hide()


func _input(_event):
	if Input.is_action_just_pressed("toggle_inventory"):
		if get_node("/root/Main").is_ingame():
			visible = not visible


func _on_visibility_changed():
	if item_list:  # visiblity_changed may get called before _ready()
		redraw_data()


func redraw_data() -> void:
	for node in item_list.get_children():
		item_list.remove_child(node)
		node.queue_free()

	for item_key in ginventory.inventory.keys():
		var item = ginventory.inventory[item_key]
		var label = Label.new()
		label.text = "%s : %s" % [item.label, item.amount]
		item_list.add_child(label)