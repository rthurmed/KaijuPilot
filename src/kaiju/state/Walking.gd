extends State


onready var kaiju: Jupiter = owner

var speed = 600
var min_offset = 40


func physics_process(delta: float):
	var default_target = kaiju.global_position + Vector2(min_offset * 2, 0)
	var target_position = default_target
	if has_node(kaiju.target_node_path):
		target_position = get_node(kaiju.target_node_path).global_position
	
	var distance = target_position - kaiju.global_position
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
