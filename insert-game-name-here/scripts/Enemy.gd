extends CharacterBody2D

@export var Ruler  = ResourceLoader.load("res://scenes/Bullets/Ruler.tscn")
@export var TriRuler = ResourceLoader.load("res://scenes/Bullets/TriangleRuler.tscn")
@export var Pie = ResourceLoader.load("res://scenes/Bullets/whole_pie.tscn")
@onready var timer = $Timer

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)

func _physics_process(delta: float):
	if Input.is_action_pressed("Shoot"):
		shoot()

func shoot():
	var rand_b = randi_range(1, 15)
	var b
	match rand_b:
		1, 2, 3, 4, 5, 6, 7, 8,9, 10:
			b = Ruler.instantiate()
		11, 12, 13, 14:
			b = TriRuler.instantiate()
		15: 
			b = Pie.instantiate()
			
	
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
		

func _on_timer_timeout():
	shoot()
	
