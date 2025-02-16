extends Control

@export var level_select_button: Button
@export var quit_button: Button
@export var settings_button: Button

@export var tutorial_button: Button

var level_select_scene = preload("res://scenes/level_select.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_select_button.pressed.connect(load_level_select_scene)

	quit_button.pressed.connect(quit)
	pass # Replace with function body.

func load_level_select_scene():
	get_tree().change_scene_to_packed(level_select_scene)

func quit():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
