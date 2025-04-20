class_name Trail
extends Line2D


const max_points: int = 2000

@onready var curve := Curve2D.new()

func _process(delta: float) -> void:
	if curve.get_baked_points().size() > max_points:
		curve.remove_point(0)
	
	points = curve.get_baked_points()

func stop() -> void:
	set_process(false)
	var tw := get_tree().create_tween()
	tw.tween_property(self, "modulate:a", 0.0, 3.0)
	await tw.finished
	queue_free()

static func create() -> Trail:
	var scn = preload("res://scenes/salt.tscn")
	return scn.instantiate()
