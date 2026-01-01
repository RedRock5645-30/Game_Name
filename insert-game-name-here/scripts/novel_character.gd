extends Node2D
@onready var sprite = $AnimatedSprite2D
var isTalking = false;
var a;

const characterFrames = {
	"Noelle": preload("res://art/Sprites/Noelle.tres"),
	"Chunni": preload("res://art/Sprites/Chunni.tres"),
	"Matty": preload("res://art/Sprites/Matty.tres"),
	"Empty": preload("res://art/Sprites/Duck_Idle_Sprites.tres")
	
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	a = $AnimatedSprite2D;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var a = $AnimatedSprite2D;
	pass
	
	
func changeChar(char:String):
	if char not in characterFrames:
		sprite.sprite_frames = characterFrames["Empty"]
	else:
		sprite.sprite_frames = characterFrames[char]
	
func comment():
	if isTalking:
		a.flip_h = false
		a.play("Idle");
	else:
		a.flip_h = false
		a.play("Talking");
		
	pass
