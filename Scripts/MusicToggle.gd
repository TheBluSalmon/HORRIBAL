extends Control

var musictoggle = true
onready var ONbtn = $"MusicON"
onready var OFFbtn = $"MusicOFF"
onready var GoBack = $"Go Back"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	ONbtn.grab_focus()


func _on_MusicON_pressed():
	MusicController.play("res://Sounds/BG_Music.wav.ogg")
	pass # Replace with function body.


func _on_MusicOFF_pressed():
	MusicController.stop()
	pass # Replace with function body.


func _on_Go_Back_pressed():
	get_tree().change_scene("res://Scenes/Main Menu.tscn")
	pass # Replace with function body.


func _on_FullScreenOn_pressed():
	OS.window_fullscreen = true
	pass # Replace with function body.


func _on_FullScreenOff_pressed():
	OS.window_fullscreen = false
	pass # Replace with function body.
