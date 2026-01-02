extends StaticBody2D

const DeathAnim = preload("uid://50at58g2mqb1")

var eventbus := Eventbus
var gdata := GData
var gstate := GState
@onready var stats: Stats = $Stats
@onready var anims: AnimationPlayer = $AnimationPlayer
@onready var shape: CollisionShape2D = $Shape
@onready var mining: Mining = $Mining


func _ready():
	stats.connect("no_health", die)
	stats.connect("hp_changed", bounce)


func mine() -> void:
	stats.hp -= 1 if not FeatureFlags.over_nine_thousand else 9999


func die() -> void:
	mining.output_resources()
	Utils.spawn(DeathAnim, global_position, gstate.level)
	queue_free()


func bounce(_val) -> void:
	anims.play("bounce")


func save() -> Dictionary:
	return {
		"scene_file_uid": Utils.path_to_uid(get_scene_file_path()),
		"parent": get_parent().get_path(),
		"pos_x": position.x,
		"pos_y": position.y,
		"stats": stats.save(),
	}


func load_before_ready(save_dict: Dictionary) -> void:
	$Stats.load_from(save_dict.stats)
