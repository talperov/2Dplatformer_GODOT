# FINAL FIX: Updated game_manager.gd - Replace your entire script with this
extends Node

signal energy_changed(new_count: int)
signal portal_opened()
signal portal_closed()

var current_area: int = 1
var area_path: String = "res://Assets/Scenes/Areas/"
var energy_cells: int = 0
var area_container: Node2D = null

func set_area_container(container: Node2D) -> void:
	area_container = container

func load_current_area() -> void:
	if not area_container:
		push_error("Area container not set!")
		return
	
	# Clear old level
	for child in area_container.get_children():
		child.queue_free()
	
	# Load new area
	var path = area_path + "area_" + str(current_area) + ".tscn"
	var scene = load(path) as PackedScene
	if not scene:
		print("YOU WIN! Game complete!")
		return
	
	var instance = scene.instantiate()
	area_container.add_child(instance)
	print("Loaded area_", current_area)
	
	# CRITICAL: Wait for full setup + reposition player
	await get_tree().process_frame
	await get_tree().process_frame  # Extra frame for inherited nodes/groups
	
	call_deferred("reposition_player")  # Safe: Runs next physics frame
	
	reset_energy_cells()

func reposition_player() -> void:
	var spawn = get_tree().get_first_node_in_group("player_start_position")
	var player_node = get_tree().get_first_node_in_group("player")
	if spawn and player_node:
		player_node.global_position = spawn.global_position
		if "velocity" in player_node:
			player_node.velocity = Vector2.ZERO
		print("Player repositioned to new spawn: ", spawn.global_position)
	else:
		print("WARNING: Spawn or player not found!")

func next_area() -> void:
	current_area += 1
	load_current_area()

func add_energy_cell() -> void:
	energy_cells += 1
	print("Energy Cells: ", energy_cells, "/4")
	energy_changed.emit(energy_cells)
	
	if energy_cells >= 4:
		await get_tree().process_frame
		var portal = get_tree().get_first_node_in_group("area_exits") as AreaExit
		if portal:
			portal.open()
			portal_opened.emit()

func reset_energy_cells() -> void:
	energy_cells = 0
	energy_changed.emit(energy_cells)
	portal_closed.emit()


func die():
	print("Player died! Resetting current level...")
	
	# Reset counter + update HUD
	reset_energy_cells()
	
	# Reload the entire current level (cells respawn)
	load_current_area()
	
	# Extra safety: force HUD update after load
	await get_tree().process_frame
	energy_changed.emit(energy_cells)
