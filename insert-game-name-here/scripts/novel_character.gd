extends Node2D

var isTalking = false;
var a;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	a = $AnimatedSprite2D;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var a = $AnimatedSprite2D;
	if isTalking:
		a.flip_h = false
		a.play("Idle");
	else:
		a.flip_h = false
		a.play("Talking");
		
	pass
