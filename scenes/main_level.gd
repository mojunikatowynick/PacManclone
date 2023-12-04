extends Node2D

var m_speed: int = 40

func _on_area_l_body_entered(body):
	body.position.x += 325

func _on_area_r_body_entered(body):
	body.position.x -= 325

func _on_game_timer_timeout():
	Global.game_play = true

func _ready():
	Global.g_restart_marker_pos = $"scale/Areas&Markers/GRestart/GRestartMarker".global_position

func _process(delta):

	$scale/path/Path2D/PathFollowRed.progress += m_speed * delta
	
func _on_g_restart_body_entered(body):
	if "alive" in body:
		body.alive()

