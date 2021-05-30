extends State


onready var pilot: Pilot = owner

var input: Vector2 = Vector2.ZERO

func process(_delta: float):
	input = Vector2.RIGHT * (
		Input.get_action_strength("right") - 
		Input.get_action_strength("left")
	)

func physics_process(_delta: float):
	pilot.global_position = pilot.kaiju.mount_point.global_position
	
	if not is_zero_approx(input.x):
		pilot.sprite.flip_h = input.x < 0

func enter():
	pilot.animation.play("mounted")

func exit(): pass
