extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	$ColorRect.visible = false
	$AnimationPlayer.animation_finished.connect(on_animation_finished)
	
func on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		animation_player.play("fade_to_normal")
	elif anim_name == "face_to_normal":
		color_rect.visible = false
		
		
func transition():
	color_rect.visible = true
	animation_player.play("fade_to_black")
