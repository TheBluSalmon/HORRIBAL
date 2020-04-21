extends Control

var reset = true

func _ready():
	if MusicController.is_playing != true:
		MusicController.stop()
		reset = false
	else:
		MusicController.stop()
		reset = true
	MusicController.stop()
	get_node("VideoPlayer").play()
	yield(get_tree().create_timer(9), "timeout")
	get_tree().change_scene("res://Scenes/Level 5 Part 2.tscn")
	if reset == true:
		MusicController.play("res://Sounds/BGRock_Music.ogg")
	else:
		MusicController.stop()
	pass


