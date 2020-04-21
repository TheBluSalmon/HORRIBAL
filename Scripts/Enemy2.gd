extends KinematicBody2D

export var Speed = 50
export var gravity = 10

signal playerdamage

onready var wait_timer = $"Timer"
onready var enemy = $"Enemy"
var motion = Vector2.ZERO

#movement
var direction = 1
onready var raycast1 = $"RayCast2D"

#Health related vars
var is_dead = false
export var health = 100

# warning-ignore:unused_argument
func _physics_process(delta):
	#Playable when NOT dead
	if is_dead == false:
		motion.x = Speed * direction
		motion.y += gravity
		motion = move_and_slide(motion, Vector2(0, -1))
		if direction == 1:
			enemy.flip_h = false
		else:
			enemy.flip_h = true
		
		if is_on_wall():
			direction = direction * -1
			$RayCast2D.position.x *= -1
  
		if $RayCast2D.is_colliding() == false:
			direction = direction * -1
			$RayCast2D.position.x *= -1
			
		for i in range(get_slide_count() - 1):
			var collision = get_slide_collision(i)
			if collision.collider.name == "Player":
				wait_timer.start()
	else:
		motion = Vector2.ZERO
		$Enemy.play("Dead")
		yield(get_tree().create_timer(2), "timeout")
		fadeaway()
 
func _on_Timer_timeout():
	emit_signal("playerdamage")
	pass # Replace with function body.

func dead():
	is_dead = true
	
func fadeaway():
	$Enemy.play("Thanos Snap")
	yield(get_tree().create_timer(6), "timeout")
	queue_free()

