extends Node2D
@onready var classmate = $classmate
@onready var player = $player
var speed = 400
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = (player.global_position - classmate.global_position).normalized()
	classmate.velocity = direction * speed
	classmate.move_and_collide(classmate.velocity)
	pass
