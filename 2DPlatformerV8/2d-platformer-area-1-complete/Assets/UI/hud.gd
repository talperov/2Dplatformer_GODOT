# UPDATED hud.gd - Replace your entire hud.gd with this
extends Control
class_name HUD

@export var energy_cell_label: Label
@export var portal_label: Label

func _ready() -> void:
	# Connect to GameManager signals
	GameManager.energy_changed.connect(_on_energy_changed)
	GameManager.portal_opened.connect(_on_portal_opened)
	GameManager.portal_closed.connect(_on_portal_closed)
	
	# Initial update
	_on_energy_changed(GameManager.energy_cells)
	_on_portal_closed()

func _on_energy_changed(number: int) -> void:
	if energy_cell_label:
		energy_cell_label.text = "x " + str(number)
	else:
		push_warning("energy_cell_label not assigned!")

func _on_portal_opened() -> void:
	if portal_label:
		portal_label.text = "Portal open!"

func _on_portal_closed() -> void:
	if portal_label:
		portal_label.text = "Portal closed. . . Get energy cells!"
