extends State


onready var pilot: Pilot = owner


func handle_input(_event: InputEvent): pass
func process(_delta: float): pass
func physics_process(_delta: float): pass

func enter():
	pilot.animation.play("mounted")

func exit(): pass
