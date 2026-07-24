extends VisibleOnScreenNotifier2D
var camera:Node2D
var cheating = false

func _ready() -> void:
	camera = get_tree().get_first_node_in_group("camera")
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cheat"):
		cheating = !cheating
	if cheating:
		if Input.is_action_just_pressed("move_left"):
			camera.translate(Vector2(-256,0))
		elif Input.is_action_just_pressed("move_right"):
			camera.translate(Vector2(256,0))
		elif Input.is_action_just_pressed("move_down"):
			camera.translate(Vector2(0,144))
		elif Input.is_action_just_pressed("move_up"):
			camera.translate(Vector2(0,-144))

func _on_screen_exited() -> void:
	#figure out which direction player is farthest from
	if not cheating:
		if(global_position.x-camera.position.x > 128):
			camera.translate(Vector2(256,0))
		elif camera.position.x - global_position.x > 128:
			camera.translate(Vector2(-256,0))
		elif camera.position.y - global_position.y > 72:
			camera.translate(Vector2(0,-144))
		elif global_position.y-camera.position.y > 72:
			camera.translate(Vector2(0,144))
