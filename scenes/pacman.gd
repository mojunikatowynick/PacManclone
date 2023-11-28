extends CharacterBody2D

var speed: int = 70
var direction: Vector2 = Vector2.LEFT
var old_direction: Vector2
var new_direction: Vector2 = Vector2.LEFT
@onready var ray = $Rays/Ray
@onready var ray_2 = $Rays/Ray2
var collide: bool = true

func _process(_delta):
	if $Rays/Ray.is_colliding() == false and $Rays/Ray2.is_colliding() == false:
		collide = false
		
	else:
		collide = true
		print("free")

	if collide ==false:
		direction = new_direction
	
	check_collision()

func _physics_process(_delta):
	
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0:
		$AnimationPlayer.play("movement")
	else:
		$AnimationPlayer.stop()

	if velocity.y > 0:
		$SpriteH.rotation_degrees = 90
	elif velocity.y <0:
		$SpriteH.rotation_degrees = -90
	elif velocity.x < 0:
		$SpriteH.rotation_degrees = -180
	elif velocity.x > 0:
		$SpriteH.rotation_degrees = 0
	else:
		$SpriteH.rotation_degrees = 0

	if Input.is_action_pressed("left"):
		$Rays.rotation_degrees = -180
		new_direction = Vector2.LEFT

	if Input.is_action_pressed("right"):
		$Rays.rotation_degrees = 0
		new_direction = Vector2.RIGHT

	if Input.is_action_pressed("up"):
		$Rays.rotation_degrees = -90
		new_direction = Vector2.UP

	if Input.is_action_pressed("down"):
		$Rays.rotation_degrees = 90
		new_direction = Vector2.DOWN

func check_collision():
	if collide ==false:
		print("free")
	else:
		print('colide')

