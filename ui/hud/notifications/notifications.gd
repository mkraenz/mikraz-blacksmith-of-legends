extends RichTextLabel

var eventbus := Eventbus

@onready var timer: Timer = $Timer

var queue := []


# Called when the node enters the scene tree for the first time.
func _ready():
	text = ""
	eventbus.show_notification.connect(_on_show_notification)
	eventbus.load_game_pressed.connect(reset)
	eventbus.new_game_pressed.connect(reset)
	eventbus.load_most_recent_game_pressed.connect(reset)


func _on_show_notification(message: String, duration_in_sec: float) -> void:
	queue.append({"message": message, "duration_in_sec": duration_in_sec})
	if timer.is_stopped():
		display_notification()


func _on_timer_timeout():
	display_notification()


func display_notification() -> void:
	text = ""

	var next_notification = queue.pop_front()
	if next_notification:
		text = "[center]{message}[/center]".format({message = tr(next_notification.message)})
		timer.start(next_notification.duration_in_sec)


func reset() -> void:
	queue = []
	text = ""
	timer.stop()
