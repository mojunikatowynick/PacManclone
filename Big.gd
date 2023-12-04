extends Area2D

func _on_body_entered(body):
	Global.big_dot_eaten = true
	if "big_dot" in body:
		body.big_dot()
	queue_free()
