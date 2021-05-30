extends State


onready var kaiju: Jupiter = owner
onready var delay = $Delay

var bodies = {}


func process(_delta: float): pass
func physics_process(_delta: float): pass

func enter():
	kaiju.animation.play("idle")
	delay.start()

func exit(): pass


func _on_ViewingArea_body_entered(body):
	if body.name != kaiju.name and body.has_node("Life"):
		bodies[body.name] = body


func _on_ViewingArea_body_exited(body):
	bodies.erase(body.name)


func _on_Delay_timeout():
	# Search new position
	kaiju.seeking_enemy = false
	var target = kaiju.global_position + Vector2(100, 0)
	
	for idx in bodies:
		var body = bodies.get(idx)
		if body.is_in_group("kaiju") and body.possessed:
			target = body.global_position
			kaiju.seeking_enemy = true
		
		if not kaiju.seeking_enemy and body.is_in_group("building"): 
			target = body.global_position
	
	kaiju.target_position = target
	transition("Walking")
