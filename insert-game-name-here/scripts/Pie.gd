class_name ExBullet extends Bullet

@export var sliceScene  = ResourceLoader.load("res://scenes/Bullets/slice_pie.tscn")

var slices = []

func _on_timer_timeout():
	var s
	for i in range(4):
		s = sliceScene.instantiate()
		slices.append(s)
		slices[i].setSpeed(i, 750)
		s.transform = global_transform
	
