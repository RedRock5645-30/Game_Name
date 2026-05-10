extends CanvasLayer

signal on_transition_finished

@onready var text_rect = $TextureRect
@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	pass	
	
	
func load_image(path):
	var image = Image.new()
	image.load(path)
	var image_texture = ImageTexture.new()
	image_texture.set_image(image)
func school_pan():
	animation_player.play("Pan up")
	on_transition_finished.emit()
