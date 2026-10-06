extends RefCounted

func root_label_ok(label: String) -> bool:
	return label.strip_edges() != ""

func view_ready(current_marked: bool) -> bool:
	return current_marked

var root_marked := false
var lamp_energy := 1.0

func mark_root_ready() -> void:
	root_marked = true

func light_ready(energy: float) -> bool:
	return energy >= 0.0 and energy <= 4.0

func may_stage() -> bool:
	return root_marked and light_ready(lamp_energy)
