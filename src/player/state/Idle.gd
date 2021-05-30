extends State


onready var pilot: Pilot = owner


func handle_input(event: InputEvent):
	if not event.is_pressed(): return
	
	if (
		event.is_action("left") or
		event.is_action("right")
	):
		transition("Walk")
	
	if event.is_action("jetpack"):
		transition("jetpack")

func process(_delta: float): pass

func physics_process(_delta: float):
	if not pilot.on_ground():
		transition("Parachute")

func enter():
	pilot.animation.play("idle")

func exit(): pass
