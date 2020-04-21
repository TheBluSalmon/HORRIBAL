extends Control

func _ready():
	yield(get_tree().create_timer(20), "timeout")
	get_tree().quit()

