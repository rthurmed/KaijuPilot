extends State


onready var kaiju: Jupiter = owner


func handle_input(_event: InputEvent): pass
func process(_delta: float): pass
func physics_process(_delta: float): pass

func enter():
	kaiju.animation.play("walk")

func exit(): pass
