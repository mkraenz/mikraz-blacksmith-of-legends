extends Control

const ItemPanel = preload("res://ui/buildings/craft/item_panel/item_panel.tscn")

@onready var grid := $M/H/AvailableItemsGrid
@onready var recipe_details := $M/H/V/RecipeDetailsCard
@onready var craft_button := $M/H/V/CraftButtons/CraftButton
var eventbus := Eventbus

## Array of Dictionaries
var recipes: Array
var selected_id: String
## Positive number or 0 or -1. 0 represents Maximum possible amount, -1 represents Keep-crafting-infinitely.
var crafted_amount_multiplier := 1:
	set = _set_crafted_amount_multiplier


func _set_crafted_amount_multiplier(val: int) -> void:
	crafted_amount_multiplier = val
	if crafted_amount_multiplier < -1:
		crafted_amount_multiplier = -1

	recipe_details.multiplier = crafted_amount_multiplier
	refresh_craft_button()
	recipe_details.refresh()


func refresh() -> void:
	Utils.remove_all_children(grid)
	for recipe in recipes:
		var panel = ItemPanel.instantiate()
		panel.recipe = recipe
		grid.add_child(panel)
		panel.selected.connect(_on_panel_selected)

	if not recipes:
		print(name, "WARNING: No recipes available")
		return
	if not selected_id:
		_on_panel_selected(recipes[0].id)

	refresh_craft_button()
	recipe_details.refresh()


func soft_reset() -> void:
	if recipes:
		_on_panel_selected(recipes[0].id)
	crafted_amount_multiplier = 1


func _on_panel_selected(recipe_id: String) -> void:
	selected_id = recipe_id
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
	crafted_amount_multiplier -= 1


func _on_craft_more_button_pressed() -> void:
	crafted_amount_multiplier += 1


func refresh_craft_button() -> void:
	var recipe = get_current_recipe()
	if not recipe:
		return
	var crafted_amount = crafted_amount_multiplier * recipe.outputAmount
	craft_button.refresh_text(crafted_amount)


func _on_craft_button_pressed() -> void:
	var recipe = get_current_recipe()
	## TODO check amount?
	eventbus.add_to_inventory.emit(recipe.id, recipe.outputAmount * crafted_amount_multiplier)
	for needed_item in recipe.needs:
		eventbus.add_to_inventory.emit(
			needed_item.id, -needed_item.amount * crafted_amount_multiplier
		)
	eventbus.close_crafting_menu.emit()
