extends Control

# Load the music player node
onready var _player = $AudioStreamPlayer
var is_playing = true

func _ready():
	MusicController.play("res://Sounds/BG_Music.wav.ogg")
# Calling this function will load the given track, and play it
func play(track_url : String):
	var track = load(track_url)
	_player.stream = track
	_player.play()
	is_playing = true

# Calling this function will stop the music
func stop():
	_player.stop()
	is_playing = false
	
