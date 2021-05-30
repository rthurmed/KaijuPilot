extends State


onready var kaiju: Jupiter = owner

var damage_caused = 40


func handle_input(_event: InputEvent): pass
func process(_delta: float): pass
func physics_process(_delta: float): pass

func enter():
	kaiju.animation.play("attack")
	pass

func exit(): pass


func _on_AttackArea_body_entered(body):
	if(
		body.has_node("Life") and (
			(
				kaiju.seeking_enemy and
				body.is_in_group("kaiju") and
				body.name != kaiju.name
			) or
			body.is_in_group("building")
		)
	):
		body.get_node("Life").hit(damage_caused)


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attack":
		transition("Seeking")
