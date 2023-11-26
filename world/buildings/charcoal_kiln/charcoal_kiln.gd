extends StaticBody2D

@onready var audio := $Audio
@onready var sprite: Sprite2D = $Sprite2D
@onready var shape: CollisionShape2D = $Shape
@onready var production := $Production


func interact() -> void:
	production.interact()


func save() -> Dictionary:
	return {
		"file_id": "charcoal_kiln_gbuAXz",
		"parent": get_parent().get_path(),
		"pos_x": position.x,
		"pos_y": position.y,
		"production": production.save(),
	}


func load_before_ready(save_dict: Dictionary) -> void:
	$Production.load_from(save_dict.production)


func on_production_producing() -> void:
	sprite.modulate = Color.GREEN


func on_production_blocked() -> void:
	sprite.modulate = Color.RED


func on_production_pending() -> void:
	sprite.modulate = Color.YELLOW


func on_production_idle() -> void:
	sprite.modulate = Color.WHITE


func on_output_products() -> void:
	audio.play()


func set_collision_scale(new_scale: float) -> void:
	shape.scale = Vector2.ONE * new_scale
