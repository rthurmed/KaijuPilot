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
	if not active(): return
	
	# Search new position
	var found_building_target = false
	kaiju.seeking_enemy = false
	var target_node_path: NodePath
	
	for idx in bodies:
		var body = bodies.get(idx)
		if body.is_in_group("kaiju") and body.possessed:
			target_node_path = body.get_path()
			kaiju.seeking_enemy = true
		
		if (
			not kaiju.seeking_enemy and
			not found_building_target and
			body.is_in_group("building")
		): 
			found_building_target = true
			target_node_path = body.get_path()
	
#	print(kaiju.name, " going to ", target_node_path)
	
	kaiju.target_node_path = target_node_path
	transition("Walking")
