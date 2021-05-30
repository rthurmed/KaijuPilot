extends State

# Possessed State
# Controls how the kaiju moves while possessed

onready var kaiju: Jupiter = owner

var input: Vector2 = Vector2.ZERO
var speed = 600


func process(_delta: float):
	input = Vector2.RIGHT * (
		Input.get_action_strength("right") - 
		Input.get_action_strength("left")
	)
	
	if Input.is_action_just_pressed("attack"):
		transition("Attacking")

func physics_process(delta: float):
	var inputn = input.normalized()
	
	var _slide = kaiju.move_and_slide(inputn * speed * delta, Vector2.UP)
	
	kaiju.animation.playback_active = not is_zero_approx(input.x)
	
	# Flip kaiju
	if not is_zero_approx(inputn.x):
		var flip = -1 if inputn.x < 0 else 1
		kaiju.flip.scale.x = flip

func enter():
	kaiju.animation.play("walk")

func exit():
	kaiju.animation.playback_active = true
