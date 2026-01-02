extends Node2D

@export var destroy_on_init: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if destroy_on_init:
		queue_free()
