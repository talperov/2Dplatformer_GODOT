# help.gd - Attach to root Control node in help.tscn
extends Control

func _ready() -> void:
	# Make sure it fills the whole screen
	anchors_preset = Control.PRESET_FULL_RECT

func _gui_input(event: InputEvent) -> void:
	# Click anywhere with mouse
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://Assets/Scenes/main_menu.tscn")

func _unhandled_input(event: InputEvent) -> void:
	# Press Esc key
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Assets/Scenes/main_menu.tscn")
