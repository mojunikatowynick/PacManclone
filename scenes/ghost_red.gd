extends CharacterBody2D

var g_speed: int = 40
@onready var eyes = $Eyes

#states
var s_scater: bool = true
var s_chase: bool = false
var s_run: bool = false
var s_eaten: bool = false
var state_counter: int = 0

var target
@onready var new_agent := $NavigationAgent2D as NavigationAgent2D

func _ready():
	$NavigationAgent2D.path_desired_distance = 4.0
	$NavigationAgent2D.target_desired_distance = 4.0
	
func _physics_process(_delta):
	eyes_movement()
		
	if Global.game_play:
		var next_path_pos: Vector2 = $NavigationAgent2D.get_next_path_position()
		var direction: Vector2 = (next_path_pos - global_position).normalized()
		$NavigationAgent2D.target_position = target
		velocity = direction * g_speed
		if Global.dot_remaining <= 150:
			g_speed = 42 									# ONLY RED !
		move_and_slide()
		
		if Global.big_dot_eaten:
			$Timers/StateTimerScatter.set_paused(true)
			$Timers/StateTimerChase.set_paused(true)
		else:
			if s_scater:
				$Timers/StateTimerScatter.set_paused(false)
			elif s_chase:
				$Timers/StateTimerChase.set_paused(false)
		


func make_path():
	if s_chase:
		target = Global.pacman_pos
	elif s_scater:
		target = Global.marker_red_pos
	elif s_eaten:
		target = Global.g_restart_marker_pos
	elif s_run:
		pass

func eyes_movement():
	if Global.big_dot_eaten:
		eyes.frame = 3
	elif Global.big_dot_eaten == false:
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

func _on_path_timer_timeout():
	make_path()


func _on_state_timer_scatter_timeout():
	s_scater = false
	s_chase = true
	if state_counter <= 4 and Global.dot_remaining >= 100: 
		$Timers/StateTimerChase.start()
	elif state_counter >= 2 and Global.dot_remaining >= 100:
		$Timers/StateTimerScatter.wait_time = 5
	elif Global.dot_remaining <= 99:
		$Timers/StateTimerChase.stop()

	
func _on_state_timer_chase_timeout():
		s_scater = true
		s_chase = false
		$Timers/StateTimerScatter.start()
		state_counter += 1

func alive():
	s_eaten = false

#func die():

func _on_area_2d_body_entered(body):
	#if Global.big_dot_eaten:
	print(body)
	s_eaten = true
