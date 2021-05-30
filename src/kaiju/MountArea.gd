extends Area2D


onready var animation = $AnimationPlayer
onready var kaiju: Jupiter = owner
var pilot_body: Pilot = null


func _on_MountArea_body_entered(body):
	if body.name == Constants.player_name:
		pilot_body = body
		animation.play("possess")

func _on_MountArea_body_exited(body):
	if body.name == Constants.player_name:
		pilot_body = null
		animation.play_backwards("possess")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "possess":
		pilot_body.mount(kaiju.get_path())
