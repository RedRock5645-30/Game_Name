extends CharacterBody2D


var speed = 400
@onready var player: player = $"../player"
@onready var animated_character = $AnimatedSprite2D

func _ready():
#	player = get_parent().get_node("player")
	pass

func _process(delta):
	if not player:
		return
	if global_position.distance_to(player.global_position)>60:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed * delta
		global_position += velocity
		animated_character.global_position = global_position
		#move_and_slide()
