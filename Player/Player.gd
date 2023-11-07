extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#var key1 = 0
#var key2 = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		$Sprite.animation = "fall"
	elif abs(velocity.x) > 0:
		$Sprite.animation = "walk"
	else:
		$Sprite.animation = "idle"

	# Handle Jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		$Sprite.play("jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			$Sprite.flip_h = true
		else:
			$Sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.name == "Boy":
		queue_free()

func _on_coin_collector_body_entered(body):
	if body.name == "Coins":
		body.get_coins(global_position)


func _on_feet_body_entered(_body):
	$FeetParticles.emitting = true


func _on_bat_area_body_entered(body):
	if body.name == "Bat" or body.name == "Bat2":
		body.queue_free()
