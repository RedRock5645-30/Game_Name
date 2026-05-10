extends Control

func _ready() -> void:
	get_tree().get_root().files_dropped.connect(_on_files_dropped)
	pass
	
func _on_load_image_pressed():
	$FileDialog.popup()


func _on_file_dialog_file_selected(path):
	var image = Image.new()
	image.load(path)
	var image_texture = ImageTexture.new()
	image_texture.set_image(image)
	$ColorRect/TextureRect.texture = image_texture
	$ColorRect/TextureRect.scale = scale_sprite_to_size($ColorRect/TextureRect, Vector2(40, 40))




func scale_sprite_to_size(sprite: TextureRect, new_size: Vector2) -> Vector2:
	if sprite.texture != null:
		print(new_size / sprite.texture.get_size())
		return new_size / sprite.texture.get_size()
	return Vector2(1, 1)

func _on_files_dropped(files):
	var path = files[0]
	var image = Image.new()
	image.load(path)
	var image_texture = ImageTexture.new()
	image_texture.set_image(image)
	$ColorRect2/TextureRectWithDrop.texture = image_texture
	

func _on_files(files) -> void:
	
	var bt1_rect = Rect2($TextureButton.global_position,$TextureButton.size) 
	
	if bt1_rect.has_point( get_global_mouse_position() ) :
		var path = files[0]
		
		var img = Image.new()
		img.load(path)
		
		var tt = ImageTexture.create_from_image(img)
		
		$TextureButton.texture_normal = tt
