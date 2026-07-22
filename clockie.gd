extends CharacterBody2D


@export var SPEED = 300.0
#const JUMP_VELOCITY = -400.0
@export var step_length = 0.1
var current_step_progress = 0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.

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
