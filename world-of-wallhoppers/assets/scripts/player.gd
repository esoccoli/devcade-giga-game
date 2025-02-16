extends CharacterBody2D

# Export stats
@export var walk_speed: int;
@export var run_speed: int;
@export var air_accel: int;
@export var jump_height: int;
@export var wall_jump_height: int;
@export var fall_speed: int;
@export var gravity: int;
@export var weight: int;

@export var jump_action: String = " "
@export var move_left_action: String = " "
@export var move_right_action: String = " "
@export var run_modifier_action: String = " "

var acceleration: float = 0;


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta;
		velocity.y = clamp(velocity.y, -jump_height, fall_speed);

	# Handle jump.
	if Input.is_action_just_pressed(jump_action) and is_on_floor():
		velocity.y = -jump_height;

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(move_left_action, move_right_action)
	if direction:
		# Push the player away from a wall when they jump off it.
		if Input.is_action_just_pressed(jump_action) and is_on_wall() and !is_on_floor():
			velocity.x = -direction * wall_jump_height / 1.8;
			velocity.y = -wall_jump_height;
		elif !is_on_floor():
			velocity.x += direction * air_accel;
		elif Input.is_action_pressed("p1_run"):
			velocity.x = direction * run_speed;
		else:
			velocity.x = direction * walk_speed;
	else:
		velocity.x = move_toward(velocity.x, 0, 50)

	move_and_slide()
