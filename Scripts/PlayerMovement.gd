extends CharacterBody2D


const SPEED = 200.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("ui_left", "ui_right")
	var directionY = Input.get_axis("ui_up", "ui_down")
	
	# Animation Direction
	if directionX > 0:
		animated_sprite.flip_h = false
	elif directionX < 0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.play("Player_Idle")
	
	# Movement
	if directionX || directionY:
		velocity = Vector2(directionX, directionY).normalized() * SPEED
		animated_sprite.play("Player_Walk")
	else:
		velocity = Vector2(move_toward(velocity.x, 0, SPEED), move_toward(velocity.y, 0, SPEED))
	
	move_and_slide()
