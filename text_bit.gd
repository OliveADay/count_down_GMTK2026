extends Area2D
@export var text_bits = ["bleh", "grah"]
var current_bit = text_bits[0]
@export var step_time = 1
var current_time;
var i = 0
var j = 0
var active = true
# for when currently on text
var on = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_time = 0;
	$CanvasLayer/Label.text = ""



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if on:
		if current_time <= 0 and active:
			$CanvasLayer/Label.text+=current_bit[i]
			print("should add letter")
			i+=1
			if current_bit.length() == i:
				active = false
			current_time = step_time
		else:
			current_time-=delta
	if Input.is_action_just_pressed("interact"):
		if on:
			if active:
				$CanvasLayer/Label.text = current_bit
				active = false
			else:
				j+=1
				if text_bits.size() > j:
					current_bit = text_bits[j]
					$CanvasLayer/Label.text= ""
					active = true
					i = 0
				else:
					$CanvasLayer.visible = false
					on = false
					j = 0
					$CanvasLayer/Label.text= ""
					current_bit = text_bits[j]
		elif has_overlapping_bodies():
			on = true
			$CanvasLayer.visible = true
			
	if has_overlapping_bodies():
		$Label.visible = true
	else:
		$Label.visible = false
			
