extends Control

const Persistence = preload("res://common/persistence/persistence.gd")

@onready var eventbus := Eventbus
@onready var continue_button := $M/V/V2/Continue


func _ready():
	refresh()


func _on_start_pressed() -> void:
	eventbus.new_game_pressed.emit()
	hide()


func _on_load_pressed() -> void:
	eventbus.load_game_pressed.emit()
	hide()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_continue_pressed():
	eventbus.load_most_recent_game_pressed.emit()
	hide()


func _on_options_pressed():
	# TODO
	pass  # Replace with function body.


func refresh() -> void:
	var persistence = Persistence.new()
	var exists = persistence.save_game_exists()
	if exists:
		continue_button.show()
	else:
		continue_button.hide()