extends Sprite

onready var light = get_node("Light2D")

func _process(delta):
	while light.energy > 16:
		light.energy += 1
		yield(get_tree().create_timer(1), "timeout")
		if light.energy == 15:
			light.energy = 0

