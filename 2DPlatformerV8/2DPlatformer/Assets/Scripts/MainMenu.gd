extends Control

func _ready() -> void:
	# Try unique name first
	if has_node("%Help"):
		%Help.pressed.connect(_on_help_pressed)
	# Fallback: manual connection will work if you used signal dock
	
	%Play.pressed.connect(_on_play_pressed)
	%Quit.pressed.connect(_on_quit_pressed)

func _on_play_pressed() -> void:
	GameManager.current_area = 1
	get_tree().change_scene_to_file("res://Assets/Scenes/gameplay.tscn")

func _on_help_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/help.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
