extends CharacterBody2D

var g_speed: int = 40
@onready var eyes = $Eyes

#states
var s_scater: bool = true
var s_chase: bool = true
var s_run: bool = false
var s_eaten: bool = false

@export var player: Node2D
@onready var new_agent := $NavigationAgent2D as NavigationAgent2D

func _ready():
	$NavigationAgent2D.path_desired_distance = 4.0
	$NavigationAgent2D.target_desired_distance = 4.0
	
func _physics_process(_delta):
	eyes_movement()
		
	if Global.game_play:
		var next_path_pos: Vector2 = $NavigationAgent2D.get_next_path_position()
		var direction: Vector2 = (next_path_pos - global_position).normalized()
		velocity = direction * g_speed
		move_and_slide()

func make_path():
	if s_chase:
		$NavigationAgent2D.target_position = player.global_position
	elif s_scater:
		pass
	elif s_eaten:
		pass
	elif s_run:
		pass

func _on_timer_timeout():
	make_path()

func eyes_movement():
	if velocity.x > 0:
		eyes.scale.x = -1
	else:
		eyes.scale.x = 1
	if velocity.y < -20:
		eyes.frame = 1
	elif velocity.y > 20:
		eyes.frame = 2
	else:
		eyes.frame = 0


