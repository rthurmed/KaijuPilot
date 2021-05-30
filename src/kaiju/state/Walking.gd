extends State


onready var kaiju: Jupiter = owner

var speed = 400
var min_offset = 30


func process(_delta: float):
	pass

func physics_process(delta: float):
	var distance = kaiju.target_position - kaiju.global_position
	var direction = Vector2.RIGHT * distance.normalized()
	
	if not is_zero_approx(direction.x):
		var flip = -1 if direction.x < 0 else 1
		kaiju.flip.scale.x = flip
	
	var _slide = kaiju.move_and_slide(direction * speed * delta, Vector2.UP)
	
	if abs(distance.x) < min_offset:
		transition("Attacking")

func enter():
	kaiju.animation.play("walk")

func exit(): pass
