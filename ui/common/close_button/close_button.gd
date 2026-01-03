extends Button

func _unhandled_input(_event: InputEvent):
	if is_visible_in_tree() and Input.is_action_just_pressed("close"):
		# mark event has handled so only the top-most ui element gets closed 
		# (reminder previous bug: I paused the game and went to options. 
		# hitting ESC then caused both options and pause menu to close simultaneously. 
		# What should happen is that only the options menu closes.)
		get_viewport().set_input_as_handled()
		pressed.emit()
