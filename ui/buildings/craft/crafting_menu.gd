extends Control

const ItemPanel = preload("res://ui/buildings/craft/item_panel/item_panel.tscn")
const CancelOrderButton = preload("res://ui/buildings/craft/cancel_order_button/cancel_order.tscn")

## type: Recipe[]
@export var recipes: Array
@export var workshop_node_path = ""
## Positive number or 0 or -1. 0 represents Maximum possible amount, INF represents open-ended.
@export var batches: float = 1.0:
	set = _set_batches

@onready var grid := $M/H/AvailableItemsGrid
@onready var recipe_details := $M/H/V/RecipeDetailsCard
@onready var craft_button := $M/H/V/CraftButtons/CraftButton
var eventbus := Eventbus
var ginventory := GInventory

var selected_id: String

var ordered_batches: float = 0.0:
	get:
		if batches != 0:
			return batches
		var max_batches := ginventory.get_max_producable_batches(get_current_recipe().needs)
		return max_batches if max_batches != 0 else 1.0


func _input(_event):
	if visible and Input.is_action_just_pressed("close"):
		close_menu()


func close_menu() -> void:
	soft_reset()
	hide()


func _set_batches(val: float) -> void:
	batches = val
	if batches < 0:
		batches = INF

	recipe_details.batches = ordered_batches
	refresh_craft_button()
	recipe_details.refresh()


func refresh() -> void:
	Utils.remove_all_children(grid)
	for recipe in recipes:
		var panel = ItemPanel.instantiate()
		panel.recipe = recipe
		grid.add_child(panel)
		panel.selected.connect(_on_panel_selected)

	var cancel_order_button = CancelOrderButton.instantiate()
	grid.add_child(cancel_order_button)
	cancel_order_button.pressed.connect(_on_cancel_order_button_pressed)

	if not recipes:
		push_error("No recipes available")
		return
	if not selected_id:
		_on_panel_selected(recipes[0].item_id)

	refresh_craft_button()
	recipe_details.refresh()


func soft_reset() -> void:
	if recipes:
		_on_panel_selected(recipes[0].id)
	batches = 1


func _on_panel_selected(recipe_id: String) -> void:
	selected_id = recipe_id
	if batches == 0:  # for Craft Max we need to force recalculation of max producable batches
		batches = 0
	recipe_details.recipe = get_current_recipe()
	recipe_details.refresh()
	refresh_craft_button()


func get_current_recipe():
	if not recipes:
		return null
	var matching_recipes = recipes.filter(func(r): return r.id == selected_id)
	if not matching_recipes:
		return null
	return matching_recipes[0]


func _on_craft_less_button_pressed() -> void:
	batches -= 1


func _on_craft_more_button_pressed() -> void:
	batches = batches + 1 if batches != INF else 0.0


func refresh_craft_button() -> void:
	var recipe = get_current_recipe()
	if not recipe:
		return
	var crafted_amount = batches * recipe.batch_size
	var ordered_amount = ordered_batches * recipe.batch_size
	craft_button.refresh_text(crafted_amount, ordered_amount)


func _on_craft_button_pressed() -> void:
	var recipe = get_current_recipe()

	eventbus.ordered_at_workshop.emit(recipe, ordered_batches, workshop_node_path)
	close_menu()


func _on_cancel_order_button_pressed() -> void:
	eventbus.cancel_order_at_workshop.emit(workshop_node_path)
	close_menu()
