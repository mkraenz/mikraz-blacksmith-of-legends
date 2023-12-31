extends Control

var gdata := GData
var ginventory := GInventory
var eventbus := Eventbus

@onready var item_list: ItemList = $M/P/M/V/H/ItemList
@onready var details = $M/P/M/V/H/BuildingNeeds

## contrary to item_list.get_selected_indexes() this tracks disabled items
var clicked_index = 0


func _ready():
	eventbus.locale_changed.connect(refresh)
	refresh()


func refresh() -> void:
	item_list.clear()
	for building in gdata.buildings.values():
		var icon = gdata.get_building_icon(building.id)
		var label = gdata.get_localized_building_label(building.id)
		var index = item_list.add_item(label, icon)
		item_list.set_item_metadata(index, building.id)


func _input(_event):
	if visible and Input.is_action_just_pressed("close"):
		close_menu()


func _physics_process(_delta: float) -> void:
	for index in item_list.item_count:
		var building = get_building(index)
		if ginventory.satisfies_all_needs(building.needs):
			item_list.set_item_disabled(index, false)
		else:
			item_list.set_item_disabled(index, true)


func _on_item_list_item_activated(index: int) -> void:
	var building = get_building(index)
	if ginventory.satisfies_all_needs(building.needs):
		eventbus.enter_build_mode.emit(building.id)


func _on_item_list_item_selected(index):
	clicked_index = index
	details.building = get_building(index)


func _on_build_button_pressed() -> void:
	if item_list.is_anything_selected():
		var selected_index = item_list.get_selected_items()[0]
		_on_item_list_item_activated(selected_index)


func get_building(index: int) -> Dictionary:
	var building_id = item_list.get_item_metadata(index)
	return gdata.get_building(building_id)


func close_menu():
	hide()


func _on_visibility_changed() -> void:
	if details and item_list:
		details.building = get_building(clicked_index)
