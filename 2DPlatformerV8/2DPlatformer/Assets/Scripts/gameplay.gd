extends Node2D

@export var current_area_container: Node2D
@onready var player: CharacterBody2D = $Player

func _ready() -> void:
	if not current_area_container:
		push_error("ERROR: Drag CurrentArea into the export field!")
		return
	
	if player:
		player.add_to_group("player")
	
	GameManager.set_area_container(current_area_container)
	
	# Wait one frame then load area 1
	await get_tree().process_frame
	GameManager.load_current_area()
	
	# Wait another frame then move player to spawn
	await get_tree().process_frame
	reposition_player()

func reposition_player() -> void:
	var spawn = get_tree().get_first_node_in_group("player_spawn")
	if spawn and player:
		player.global_position = spawn.global_position
		player.velocity = Vector2.ZERO
