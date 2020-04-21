extends Area2D

signal playerdamage

func _on_Spike_body_entered(body):
	if body.name == "Player":
		$"Timer".start()
	pass # Replace with function body.



func _on_Timer_timeout():
	emit_signal("playerdamage")
	pass # Replace with function body.
