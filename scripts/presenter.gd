extends Node3D

const Rules = preload("res://scripts/rules.gd")
var rules = Rules.new()

func _ready() -> void:
	rules.lamp_energy = 1.5
	if not rules.light_ready(rules.lamp_energy):
		push_error("Empty 3D light is outside 0 to 4.")
	if not rules.view_ready(get_viewport().get_camera_3d() != null):
		push_error("Empty 3D has no current camera.")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("leap"):
		rules.mark_root_ready()
	if event.is_action_pressed("primary") and rules.may_stage():
		_go("res://scenes/stage.tscn")

func _go(next_path: String) -> void:
	get_tree().change_scene_to_file(next_path)
