extends State


onready var pilot: Pilot = owner

var input: Vector2 = Vector2.ZERO
var speed = 60


func process(delta: float):
	input = Vector2.RIGHT * (
		Input.get_action_strength("right") - 
		Input.get_action_strength("left")
	)
	pilot.move = lerp(pilot.move, input * speed, delta * 2)
	
	if Input.is_action_just_pressed("jetpack"):
		transition("Jetpack")


func physics_process(delta: float):
	var movement = pilot.move
	
	var _slide = pilot.move_and_slide(
		movement + (Constants.gravity / 3) * delta,
		Vector2.UP
	)
	
	if pilot.on_ground():
		transition("Walk")
	
	if not is_zero_approx(input.x):
		pilot.sprite.flip_h = input.x < 0


func enter():
	pilot.animation.play("parachute")
