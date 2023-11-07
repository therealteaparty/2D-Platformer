extends CharacterBody2D

@onready var SM = $StateMachine

@export var walking = 250
@export var running = 250
@export var jump = 600
var direction = 1

func _ready():
	velocity.x = running
	SM.set_state("Move")

func _physics_process(_delta):
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	velocity = velocity
	
	if direction < 0 and not $AnimatedSprite2D.flip_h: 
		$AnimatedSprite2D.flip_h = true
	if direction > 0 and $AnimatedSprite2D.flip_h: 
		$AnimatedSprite2D.flip_h = false
	$Can_Jump.target_position.x = direction*abs($Can_Jump.target_position.x)
	
func set_animation(anim):
	if $AnimatedSprite2D.animation == anim: return
	if $AnimatedSprite2D.sprite_frames.has_animation(anim): $AnimatedSprite2D.play(anim)
	else: $AnimatedSprite2D.play()

func _on_above_and_above_body_entered(body):
	if body.name == "Player":
		body.die()
