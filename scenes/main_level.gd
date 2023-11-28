extends Node2D

func _on_area_l_body_entered(body):
	body.position.x += 325

func _on_area_r_body_entered(body):
	body.position.x -= 325
