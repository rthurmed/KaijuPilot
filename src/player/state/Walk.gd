extends State


onready var pilot: Pilot = owner

var input: Vector2 = Vector2.ZERO
var speed = 100


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
	var gravity = Constants.gravity if not pilot.on_ground() else Vector2.ZERO
	
	var _slide = pilot.move_and_slide(
		movement + gravity * delta,
		Vector2.UP
	)
	
	var animate = "idle" if is_zero_approx(input.x) else "walk"
	pilot.animation.play(animate)
	
	if not pilot.on_ground():
		transition("Parachute")
	
	if not is_zero_approx(input.x):
		pilot.sprite.flip_h = input.x < 0


func enter():
	pilot.animation.play("walk")
