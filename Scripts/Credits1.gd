extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Programmer Credit".visible = false
	$"Artist Credit".visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Credit_Programmer_body_entered(body):
	if body.name == "Player":
		$"Programmer Credit".visible = true
	pass # Replace with function body.


func _on_Credit_Artist_body_entered(body):
	if body.name == "Player":
		$"Artist Credit".visible = true
	pass # Replace with function body.


