extends State


onready var pilot: Pilot = owner


func process(_delta: float):
	pass

func physics_process(_delta: float):
	pilot.global_position = pilot.kaiju.mount_point.global_position

func enter():
	pilot.animation.play("mounted")

func exit(): pass
