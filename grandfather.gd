extends Area2D
var near = false

func _ready() -> void:
	$main.speed = 0;
	print($main.speed)
	
func _process(delta: float) -> void:
	if $Label.visible and Input.is_action_just_pressed("interact"):
		$main.speed = 1


func _on_body_entered(body: Node2D) -> void:
	$Label.visible = true


func _on_body_exited(body: Node2D) -> void:
	$Label.visible = false
