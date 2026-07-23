extends VisibleOnScreenNotifier2D
var camera:Node2D

func _ready() -> void:
	camera = get_tree().get_first_node_in_group("camera")

func _on_screen_exited() -> void:
	#figure out which direction player is farthest from 
	if(global_position.x-camera.position.x > 128):
		camera.translate(Vector2(256,0))
	elif camera.position.x - global_position.x > 128:
		camera.translate(Vector2(-256,0))
	elif camera.position.y - global_position.y > 72:
		camera.translate(Vector2(0,-144))
	elif global_position.y-camera.position.y > 72:
		camera.translate(Vector2(0,144))
