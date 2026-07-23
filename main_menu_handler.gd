extends Node2D

var world_resource = preload("res://world.tscn")


func _on_button_pressed() -> void:
	var world = world_resource.instantiate()
	get_tree().root.add_child(world)
	$CanvasLayer.visible = false


func _on_instructions_b_pressed() -> void:
	$CanvasLayer/instructions_1.visible = true


func _on_next_1_pressed() -> void:
	$CanvasLayer/instructions_2.visible = true


func _on_next_2_pressed() -> void:
	$CanvasLayer/instructions_3.visible = true


func _on_next_3_pressed() -> void:
	$CanvasLayer/instructions_1.visible = false
	$CanvasLayer/instructions_2.visible = false
	$CanvasLayer/instructions_3.visible = false
