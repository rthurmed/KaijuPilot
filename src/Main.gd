extends Node2D


onready var camera_animation = $Pilot/Camera2D/AnimationPlayer


func _on_Pilot_mounted():
	camera_animation.play("mount_zoom")

func _on_Pilot_unmounted():
	camera_animation.play_backwards("mount_zoom")
