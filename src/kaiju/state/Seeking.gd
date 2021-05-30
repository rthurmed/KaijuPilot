extends State


onready var kaiju: Jupiter = owner

var bodies = {}


func process(_delta: float): pass

func physics_process(_delta: float):
	pass

func enter():
	kaiju.animation.play("idle")

func exit(): pass


func _on_ViewingArea_body_entered(body):
	bodies[body.name] = body


func _on_ViewingArea_body_exited(body):
	bodies.erase(body.name)
