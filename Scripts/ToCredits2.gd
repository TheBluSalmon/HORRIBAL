extends Area2D

func _on_Next_Level_Loader_body_entered(body):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene("res://Scenes/Credits2.tscn")
	pass # Replace with function body.
