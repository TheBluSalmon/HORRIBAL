extends KinematicBody2D

#signals
signal health_updated(health)
signal killed()

#Changeable values
export var max_speed = 128
export var gravity = 200
export var jump_force = 175

#Laws of the character
const air_resistance = 0.02
const acceleration = 512
const friction = 0.10
onready var character = $Player
var motion = Vector2.ZERO

#Cutscene determiner
var is_gun_taken = false

#Health related vars
onready var invulnerabilitytimer = $"InvulnerabilityTimer"
var is_dead = false
export var health = 100
var timer_started = false
var prev_health = health
var playing_health_damage = false

#Get nodes
onready var hud_score_display = get_parent().get_node("Top GUI/Score Display")
onready var score_display = get_node("Score")
onready var coin_collected = get_node("Coin_Collected") 
onready var small_jump_sound = get_node("Jump_Audio")
onready var health_display = get_parent().get_node("Top GUI/Health")
onready var heart_hud = get_parent().get_node("Top GUI/Health Bar")
onready var hit_sound = get_node("Hit_Sound")
onready var playershootpos = get_node("Position2D")
onready var playersprite = get_node("Player")
onready var shotgun = get_node("Shotgun")
onready var shotgun_sound = get_node("Shotgun Sound")
onready var shotgun_reload_sound = get_node("Shotgun Reload")


func _ready():
	remove_child($Bullet)
	heart_hud.value = 100
	heart_hud.tint_progress = Color.green

func _physics_process(delta):
	Engine.target_fps = 60 #60 fps is epic
	#Playable when NOT dead
	if is_dead == false:
		var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		
		hud_score_display.text = String(GlobalScore.score)
		score_display.text = String(GlobalScore.score)
		heart_hud.value = health
		
		if health >= 75 && health <= 100:
			heart_hud.tint_progress = Color.green
		if health >= 50 && health <= 74:
			heart_hud.tint_progress = Color.orange
		if health >= 25 && health <= 49:
			heart_hud.tint_progress = Color.red
		
		if x_input != 0:
			if x_input == -1:
				if playing_health_damage == false:
					character.flip_h = true
					character.play("Idle")
					shotgun.global_position = $"Shotgun Left".global_position
					shotgun.flip_h = true
			if x_input == 1:
				if playing_health_damage == false:
					character.flip_h = false
					character.play("Idle")
					shotgun.global_position = $"Shotgun Right".global_position
					shotgun.flip_h = false
			motion.x += x_input * acceleration * delta
			motion.x = clamp(motion.x, -max_speed, max_speed)
		else:
			if playing_health_damage == false:
				motion.x = lerp(motion.x, 0, air_resistance)
				character.play("Idle")
			
		motion.y += gravity * delta
		if is_on_floor():
			if x_input == 0:
				motion.x = lerp(motion.x, 0, friction)
			if Input.is_action_pressed("ui_up"):
				motion.y = -jump_force
				small_jump_sound.play()
		
		if Input.is_action_just_pressed("ui_action"):
			shoot()
		if Input.is_action_just_released("ui_action"):
			yield(get_tree().create_timer(2), "timeout")
						
		motion = move_and_slide(motion, Vector2.UP)
		pass

func _on_Coin_coin_collected():
	GlobalScore.score += 1
	coin_collected.play()
	pass # Replace with function body.

func dead():
	is_dead = true
	if health <= 0:
		heart_hud.value = 0
	character.play("Dead")
	motion = Vector2.ZERO
	$"Player Collision".disabled = true
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://Scenes/Game Over.tscn")

func damage(amount):
	health = health - amount #Reduce health
	hit_sound.play()
	if prev_health != health: #They won't be the same
		playing_health_damage = true
		character.play("Damage")
		playing_health_damage = false
		prev_health = health #Update health
	if health <= 0:
		dead()
	
	
func _on_Enemy_playerdamage():
	damage(25)
	pass # Replace with function body.


func _on_InvulnerabilityTimer_timeout():
	timer_started = false
	pass # Replace with function body.


func _on_Level_Reloader_outofboundary():
	damage(100)
	pass # Replace with function body.


func _on_Spike_playerdamage():
	damage(25)
	pass # Replace with function body.
	


func _on_MiniGun_Area_Cutscene1Start():
	get_tree().change_scene("res://Scenes/Level 5 Cutscene.tscn")
	pass # Replace with function body.

func shoot():
	var bullet = load("res://Sprites/Gun Animation/Bullet.tscn")
	var bulletinstance = bullet.instance()
	if character.flip_h == true:
		bulletinstance.global_position = $LeftPosition.global_position
		bulletinstance.direction = -1
		get_parent().add_child(bulletinstance)
		$"Shotgun".play("Shoot")
		shotgun_sound.play()
		yield(get_tree().create_timer(0.5), "timeout")
		shotgun_reload_sound.play()
	else:
		bulletinstance.global_position = $RightPosition.global_position
		bulletinstance.direction = 1
		get_parent().add_child(bulletinstance)
		$"Shotgun".play("Shoot")
		shotgun_sound.play()
		yield(get_tree().create_timer(0.5), "timeout")
		shotgun_reload_sound.play()
	$"Shotgun".play("Normal")

func _on_Enemy2_playerdamage():
	damage(35)
	pass # Replace with function body.
