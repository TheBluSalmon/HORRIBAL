extends Node

onready var globalplayer = get_node("samplePlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	globalplayer.play()
	pass # Replace with function body.

