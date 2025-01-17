extends CharacterBody2D

const SPEED = 100
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	var direction_vertical := Input.get_axis("up", "down")
	var direction_horizontal := Input.get_axis("left", "right")
	
	# Reset velocity
	velocity = Vector2.ZERO
	
	# Handle vertical movement
	if direction_vertical != 0:
		velocity.y = direction_vertical * SPEED
		if direction_vertical > 0:
			animated_sprite.play("down_walk")
		else:
			animated_sprite.play("up_walk")
	
	# Handle horizontal movement
	elif direction_horizontal != 0:
		velocity.x = direction_horizontal * SPEED
		animated_sprite.flip_h = direction_horizontal < 0
		animated_sprite.play("run")
	
	# Idle state
	else:
		animated_sprite.play("idle")
	
	# Apply movement
	move_and_slide()
