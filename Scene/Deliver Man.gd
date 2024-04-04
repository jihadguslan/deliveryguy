extends CharacterBody2D

@onready var anim = $AnimationPlayer
@onready var pack_image = $Paket
@onready var sprite = $Sprite2D
@onready var info_paket = $"Info Paket"
@onready var point = $CanvasLayer/Screen/Point
@onready var time = $CanvasLayer/Screen/Time
@onready var screen = $CanvasLayer/Screen

var paket = ""
var poin = 0
var time_left = 60
const SPEED = 250.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Lompat") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Mundur", "Maju")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	point.text = str(poin)
	time.text = str(time_left)
	
	move_and_slide()
	anim_control()

func anim_control():
	if velocity.x != 0 :
		anim.play("Run")
		if velocity.x > 0 :
			sprite.flip_h = false
		if velocity.x < 0 :
			sprite.flip_h = true
	else :
		anim.play("Idle")

func _on_timer_timeout():
	time_left -= 1
	if time_left <= 0 :
		var gameover = preload("res://Scene/GameOverScene.tscn").instantiate()
		screen.add_child(gameover)
		get_tree().paused = true
