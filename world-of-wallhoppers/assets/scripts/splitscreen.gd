extends Node2D

var viewportP1;
var viewportP2;
var staticCamera;
var cameraP1;
var cameraP2;
var levelScene;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewportP1 = $HBoxContainer/ViewportContainerP1/SubViewport;
	viewportP2 = $HBoxContainer/ViewportContainerP2/SubViewport;
	
	viewportP2.world_2d = viewportP1.world_2d
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
