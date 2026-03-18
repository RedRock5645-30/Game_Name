extends Area2D
var speed = 0
var direction: Vector2
var degrees: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_position += speed * delta* direction
	rotation_degrees -= degrees
	
func setSpeed(cartPlan, s):
	match cartPlan:
		1:
			direction = Vector2(randi(), randi()).normalized()
		2:
			direction = Vector2(-randi(), randi()).normalized()
		3:
			direction = Vector2(-randi(), -randi()).normalized()
		4: 
			direction = Vector2(randi(), -randi()).normalized()
	self.speed = s
