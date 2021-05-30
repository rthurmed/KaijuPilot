extends State


onready var pilot: Pilot = owner
onready var particle1: CPUParticles2D = get_node("../../JetpackParticles")
onready var particle2: CPUParticles2D = get_node("../../JetpackSparkleParticles")

var input: Vector2 = Vector2.ZERO
var speed = 30
var jetpack_power = 500


func process(delta: float):
	if Input.is_action_just_released("jetpack"):
		transition("Walk")
	
	input = Vector2.RIGHT * (
		Input.get_action_strength("right") - 
		Input.get_action_strength("left")
	)
	
	pilot.move = lerp(pilot.move, input * speed, delta * 2)


func physics_process(delta: float):
	var movement = pilot.move
	var jetpack = Vector2.UP * jetpack_power
	
	var _slide = pilot.move_and_slide(
		movement + jetpack * delta,
		Vector2.UP
	)
	
	if not is_zero_approx(input.x):
		pilot.sprite.flip_h = input.x < 0


func enter():
	pilot.animation.play("propelled")
	particle1.emitting = true
	particle2.emitting = true


func exit():
	particle1.emitting = false
	particle2.emitting = false
