extends Sprite2D
@export var speed = 1
@export var hour_length = 60
@export var stop_bit = -90
var current_speed = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_speed = speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$min_hand.rotate(-current_speed*delta)
	$hour_hand.rotate(-current_speed*delta/hour_length)
	if $hour_hand.rotation_degrees <= stop_bit:
		current_speed = 0
	else:
		current_speed = speed
