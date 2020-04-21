extends Area2D

signal outofboundary

onready var hit_play = get_node("Hit Sound")
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			#Make sure the scene is correct
			hit_play.play()
			yield(get_tree().create_timer(0.001), "timeout")
			emit_signal("outofboundary")
			
