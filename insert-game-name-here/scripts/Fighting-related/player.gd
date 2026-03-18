extends CharacterBody2D

class_name player
const max_speed = 400
const accel = 1500
var direction = "down"
var curr_trail: Trail
const max_points = 100

	
func _ready() -> void:
	pass

func _physics_process(delta):
	# Update velocity towards the desired direction based on input
	if Input.is_action_pressed("Space"):
		$trail.add_point(position)
		$trail.visible = true
	else:
		$trail.clear_points()
		$trail.visible = false
		
	#if $trail.get_point_count()>max_points:
		#$trail.remove_point(0)
	if Input.is_action_pressed("ui_right"):
		play_animation(1)
		direction = "right"
	elif Input.is_action_pressed("ui_left"):
		play_animation(1)
		direction = "left"
	elif Input.is_action_pressed("ui_up"):
		play_animation(1)
		direction = "up"
	elif Input.is_action_pressed("ui_down"):
		play_animation(1)
		direction = "down"
	else:
		play_animation(0)

	velocity = velocity.move_toward(Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * max_speed, accel * delta)

	# Move the character
	move_and_slide()

func play_animation(movement):
	var dir = direction
	var a = $AnimatedSprite2D
	
	if dir == "right":
		a.flip_h = false
		if movement == 1:
			a.play("attack_right")
		elif movement == 0:
			a.play("idle")
	elif dir == "left":
		a.flip_h = false
		if movement == 1:
			a.play("attack_left")
		elif movement == 0:
			a.play("idle")
	elif dir == "up":
		a.flip_h = false
		if movement == 1:
			a.play("attack_left")
		elif movement == 0:
			a.play("idle")
	elif dir == "down":
		a.flip_h = false
		if movement == 1:
			a.play("attack_left")
		elif movement == 0:
			a.play("idle")
