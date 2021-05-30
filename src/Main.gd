extends Node2D


onready var camera_animation = $Pilot/Camera2D/AnimationPlayer
onready var objective_label = $CanvasLayer/UI/Objective
onready var animation = $AnimationPlayer
var building_count = 10

func _ready():
	building_count = get_node("Buildings").get_child_count()
	update_objetive()
	
	for building in get_node("Buildings").get_children():
		building.connect("death", self, "_on_Building_death")


func update_objetive():
	objective_label.text = str(building_count, " buildings left")


func _on_Building_death():
	building_count -= 1
	if building_count <= 0:
		animation.play("end")
	else:
		update_objetive()


func _on_Pilot_mounted():
	camera_animation.play("mount_zoom")

func _on_Pilot_unmounted():
	camera_animation.play_backwards("mount_zoom")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "end":
		var _status = get_tree().change_scene("res://src/GameOver.tscn")
