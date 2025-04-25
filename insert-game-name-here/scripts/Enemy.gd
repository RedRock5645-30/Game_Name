extends CharacterBody2D

@export var Ruler  = ResourceLoader.load("res://scenes/Bullets/Ruler.tscn")
@export var TriRuler = ResourceLoader.load("res://scenes/Bullets/TriangleRuler.tscn")
@onready var timer = $Timer

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)

func _physics_process(delta: float):
	if Input.is_action_pressed("Shoot"):
		shoot()

func shoot():
	var rand_b = randi_range(1, 2)
	var b
	match rand_b:
		1:
			b = Ruler.instantiate()
		2:
			b = TriRuler.instantiate()
			
	
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
		

func _on_timer_timeout():
	shoot()
	
