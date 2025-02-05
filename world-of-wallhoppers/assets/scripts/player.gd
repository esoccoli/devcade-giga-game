extends CharacterBody2D

# Export stats
@export var run_speed: float;
@export var max_run_speed: float;
@export var air_speed: float;
@export var jump_height: float;
@export var wall_jump_height: float;

@export var jump_action: String = " "
@export var move_left_action: String = " "
@export var move_right_action: String = " "

var acceleration: float = 0;


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(jump_action) and (is_on_floor()):
		velocity.y = -jump_height;

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(move_left_action, move_right_action)
	if direction:
		if !is_on_floor():
			acceleration = direction * air_speed;
		else:
			acceleration = clamp(direction * run_speed, -max_run_speed, max_run_speed);
		# Push the player away from a wall when they jump off it.
		if Input.is_action_just_pressed(jump_action) and (is_on_wall()):
			velocity.x = -direction * wall_jump_height / 2;
			velocity.y = -wall_jump_height;
		else:
			velocity.x += acceleration;
	else:
		velocity.x = move_toward(velocity.x, 0, 50)

	move_and_slide()
