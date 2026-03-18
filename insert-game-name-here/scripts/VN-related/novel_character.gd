extends Node2D
@onready var sprite = $AnimatedSprite2D
var isTalking = false
var a

var viewportWidth = 1920
var viewportHeight = 1080

const characterFrames = {
	"Noelle": preload("res://art/Sprites/Noelle.tres"),
	"Chunni": preload("res://art/Sprites/Chunni.tres"),
	"Matty": preload("res://art/Sprites/Matty.tres"),
	"Empty": preload("res://art/Sprites/Duck_Idle_Sprites.tres")
	
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	a = $AnimatedSprite2D
	a.position = Vector2(0, -viewportHeight/2)
	#var scale = viewportWidth / sprite.get_size().x
	#a.scale = Vector2(scale, scale)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var a = $AnimatedSprite2D;
	pass

func get_animated_sprite_2d_size() -> Vector2:
	return a.sprite_frames.get_frame_texture(a.animation, a.frame).get_size()
	
func changeChar(char:String):
	if char not in characterFrames:
		sprite.sprite_frames = characterFrames["Empty"]
	else:
		sprite.sprite_frames = characterFrames[char]
		var sprite_size = get_animated_sprite_2d_size()
		var scale = viewportWidth / (2*sprite_size.x)
		a.scale = Vector2(scale, scale)
	
func comment():
	if isTalking:
		a.flip_h = false
		a.play("Idle");
	else:
		a.flip_h = false
		a.play("Talking");
		
	pass
