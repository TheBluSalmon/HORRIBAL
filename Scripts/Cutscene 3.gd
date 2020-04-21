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
	yield(get_tree().create_timer(25), "timeout")
	get_tree().change_scene("res://Scenes/Credits1.tscn")
	MusicController.play("res://Sounds/ComeTogether.wav")
