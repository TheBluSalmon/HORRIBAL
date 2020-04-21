extends Control

func _ready():
	$RichTextLabel.text = "You got " + String(GlobalScore.score) + " coins!"
# Called when the node enters the scene tree for the first time.
func _process(delta):
	yield(get_tree().create_timer(30), "timeout")
	get_tree().change_scene("res://Scenes/Main Menu.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
