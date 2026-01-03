extends Control

@onready var eventbus := Eventbus


func _on_load_pressed() -> void:
	eventbus.load_game_pressed.emit()


func _on_quit_to_title_pressed():
	eventbus.quit_to_title_pressed.emit()


func _on_resume_pressed():
	eventbus.resume_game_pressed.emit()


func _on_save_pressed():
	eventbus.save_game_pressed.emit()

func _unhandled_input(_event: InputEvent) -> void:
	if is_visible_in_tree() and Input.is_action_just_released("close"):
		get_viewport().set_input_as_handled()
		_on_resume_pressed()
