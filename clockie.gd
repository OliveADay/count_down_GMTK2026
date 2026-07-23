extends CharacterBody2D


@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var step_length = 0.1
var current_step_progress = 0
#var safe = false


func _physics_process(delta: float) -> void:
	#guy gives you a bunch of clock movements, when you in range of repaired clock then you get rehealed
	#till you get to LORD CLOCKHATER who you gotta beat
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if current_step_progress <= 0:
			if $body.rotation_degrees == 0 or $body.rotation_degrees < 0:
				$body.rotation_degrees = 15+direction*10
			else:
				$body.rotation_degrees = -15+direction*10
			current_step_progress = step_length
		else:
			current_step_progress-=delta
			
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$body.rotation = 0
		current_step_progress = 0

	move_and_slide()


func _on_safe_check_area_entered(area: Area2D) -> void:
	#safe = true
	$body.speed = 0
	$body/min_hand.rotation_degrees = 0
	$body/hour_hand.rotation_degrees = 0
	print("safe")


func _on_safe_check_area_exited(area: Area2D) -> void:
	#safe = false
	$body.speed = 1
