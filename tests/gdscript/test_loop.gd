extends AutoworkTest

const Rules = preload("res://scripts/rules.gd")

func test_root_label() -> void:
	var rules = Rules.new()
	assert_true(rules.root_label_ok("Opener"), "named root")
	assert_false(rules.root_label_ok("  "), "blank label rejected")

func test_missing_view() -> void:
	var rules = Rules.new()
	assert_false(rules.view_ready(false), "missing camera rejected")
	assert_true(rules.view_ready(true), "current camera accepted")

func test_stage_gate() -> void:
	var rules = Rules.new()
	assert_false(rules.may_stage(), "unmarked")
	rules.mark_root_ready()
	assert_true(rules.may_stage(), "marked")
	var packed = load("res://scenes/stage.tscn")
	assert_true(packed != null, "stage loads")

func test_light_ready() -> void:
	var rules = Rules.new()
	assert_false(rules.light_ready(-0.1), "below range")
	assert_true(rules.light_ready(0.0), "zero energy")
	assert_true(rules.light_ready(4.0), "top of range")
	assert_false(rules.light_ready(4.1), "above range")
	assert_true(load("res://scenes/stage.tscn") != null, "stage loads")
