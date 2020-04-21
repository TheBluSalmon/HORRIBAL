extends Control

onready var main_menu_btn = get_node("Main Menu Btn")
onready var select_sound = get_node("Select_Sound")

func _input(event):
	if event.is_action_pressed("pause"):
		$"Continue Btn".grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible

func _on_Continue_Btn_pressed():
	select_sound.play()
	get_tree().paused = not get_tree().paused
	visible = not visible

func _on_Main_Menu_Btn_pressed():
	select_sound.play()
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Main Menu.tscn")# Replace with function body.
