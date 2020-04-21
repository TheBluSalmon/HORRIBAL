extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_pressed("ui_action"):
		MusicController.play("res://Sounds/Shotgun_Sound_Effect.wav")
		get_tree().change_scene("res://Scenes/Cutscene 3.tscn")
