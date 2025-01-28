extends Camera2D

@export var object: Node2D

@export var interpolation_speed: float = 3

@export var interpolation_cutoff: float = 100 # in pixels


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = basic_lerp(position, object.position, delta)


## the function below is possibly inferior
## but it does do some nice looking vibrations at higher object velocities

func basic_lerp(from: Vector2, to: Vector2, delta: float) -> Vector2:
	var relative_offset = from - to

	if(relative_offset.length() < interpolation_cutoff):
		return from

	return from - relative_offset * delta * interpolation_speed