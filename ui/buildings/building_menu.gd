extends Control

var gdata := GData
var eventbus := Eventbus
@onready var item_list: ItemList = $Background/M/V/ItemList


func _ready():
	item_list.clear()
	for building in gdata.buildings.values():
		var icon = gdata.get_building_icon(building.id)
		var index = item_list.add_item(building.label, icon)
		item_list.set_item_metadata(index, building.id)


func _on_item_list_item_activated(index: int) -> void:
	var building_id = item_list.get_item_metadata(index)
	eventbus.enter_build_mode.emit(building_id)
