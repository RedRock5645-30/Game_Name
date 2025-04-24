extends CharacterBody2D

@export var Ruler  = ResourceLoader.load("res://scenes/Ruler.tscn")
@onready var timer = $Timer

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)

func _physics_process(delta: float):
	if Input.is_action_pressed("Shoot"):
		shoot()

func shoot():
	var b = Ruler.instantiate()
	owner.add_child(b)		
	b.transform = $Muzzle.global_transform
		

func _on_timer_timeout():
	shoot()
	
