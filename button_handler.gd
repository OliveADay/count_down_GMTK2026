extends Node2D
@export var pos:Vector2

func _on_main_menu_pressed() -> void:
	get_tree().reload_current_scene()


func _on_reload_pressed() -> void:
	$Clockie.position = pos
	$Clockie/body/hour_hand.rotation_degrees = 0
	$Clockie/body/min_hand.rotation_degrees = 0
	$CanvasLayer.visible = false
