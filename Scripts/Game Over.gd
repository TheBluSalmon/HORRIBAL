extends Control

var resetmusic = true

func _ready():
	if MusicController.is_playing == true:
		MusicController.stop()
		resetmusic = true
	else:
		MusicController.stop()
		resetmusic = false
	get_node("AudioStreamPlayer").play()
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://Scenes/Main Menu.tscn")
	if resetmusic == true:
		MusicController.play("res://Sounds/BG_Music.wav.ogg")
	else:
		MusicController.stop()
	get_tree().paused = false
