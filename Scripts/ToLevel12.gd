extends Area2D

#haha yes

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene("res://Scenes/Level 12.tscn")

