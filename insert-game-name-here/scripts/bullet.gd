extends Area2D
class_name Bullet

var speed = 750
var direction: Vector2
var degrees: int
var quadrant = randi_range(1, 4)#for some reason the code above constraints it to one quadrant, so this spreads it out 


func _ready() -> void:
	
	match quadrant:
		1:
			direction = Vector2(randi(), randi()).normalized()
		2:
			direction = Vector2(-randi(), randi()).normalized()
		3:
			direction = Vector2(-randi(), -randi()).normalized()
		4: 
			direction = Vector2(randi(), -randi()).normalized()

func _physics_process(delta):
	global_position += speed * delta* direction
	rotation_degrees -= 5

func _on_Bullet_body_entered(body):
	if body.is_in_group("Player"):
		body.queue_free()
	queue_free()
