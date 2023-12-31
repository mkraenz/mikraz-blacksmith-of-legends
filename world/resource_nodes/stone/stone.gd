extends StaticBody2D

const DeathAnim = preload("res://world/resource_nodes/stone/stone_death.tscn")

var eventbus := Eventbus
var gstate := GState
@onready var stats: Stats = $Stats
@onready var anims: AnimationPlayer = $AnimationPlayer
@onready var shape: CollisionShape2D = $Shape
@onready var mining := $Mining


func _ready():
	stats.connect("no_health", die)
	stats.connect("hp_changed", _on_hit)


func mine() -> void:
	stats.hp -= 1 if not FeatureFlags.over_nine_thousand else 9999


func die() -> void:
	mining.output_resources()
	Utils.spawn(DeathAnim, global_position, gstate.level)
	queue_free()


func _on_hit(_val) -> void:
	anims.play("hit")


func save() -> Dictionary:
	return {
		"file_id": "stone_ul586x",
		"parent": get_parent().get_path(),
		"pos_x": position.x,
		"pos_y": position.y,
		"stats": stats.save(),
	}


func load_before_ready(save_dict: Dictionary) -> void:
	$Stats.load_from(save_dict.stats)
