extends Area2D

export var bullet_speed = 500
var motion = Vector2()
var direction = 1

func start():
	position = Vector2()
	pass

func set_bullet_direction(value):
	direction = value
	if value == -1:
		$Bullet.flip_h = true
	else:
		$Bullet.flip_h = false

func _physics_process(delta):
	motion.x = bullet_speed * delta * direction
	translate(motion)


func _on_VisibilityNotifier_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_Bullet_body_entered(body):
	if body.name == "Player":
		motion.x = bullet_speed * direction
	elif body.name == "Enemy":
		body.dead()
		queue_free()
	elif body.name == "Enemy2":
		body.dead()
		queue_free()
	elif body.name == "Enemy3":
		body.dead()
		queue_free()
	elif body.name == "Enemy4":
		body.dead()
		queue_free()
	else:
		queue_free()
	
