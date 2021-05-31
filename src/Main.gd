extends Node2D


onready var camera_animation = $Pilot/Camera2D/AnimationPlayer
onready var objective_label = $CanvasLayer/UI/Objective
onready var animation = $AnimationPlayer
var building_count = 10
var kaiju_count = 4

func _ready():
	building_count = get_node("Buildings").get_child_count()
	update_objetive()
	
	for node in get_node("Buildings").get_children():
		node.connect("death", self, "_on_Building_death")
	
	kaiju_count = get_node("Kaijus").get_child_count()
	
	for node in get_node("Kaijus").get_children():
		node.connect("death", self, "_on_Kaiju_death")


func _process(_delta):
	if building_count <= 0:
		animation.play("end")
	if kaiju_count <= 1 and get_node("Kaijus").get_children()[0].possessed:
		animation.play("end_good")


func update_objetive():
	objective_label.text = str(building_count, " buildings left")


func _on_Building_death():
	building_count -= 1
	update_objetive()


func _on_Kaiju_death():
	kaiju_count -= 1


func _on_Pilot_mounted():
	camera_animation.play("mount_zoom")

func _on_Pilot_unmounted():
	camera_animation.play_backwards("mount_zoom")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "end":
		var _status1 = get_tree().change_scene("res://src/GameOver.tscn")
	if anim_name == "end_good":
		var _status2 = get_tree().change_scene("res://src/YouWin.tscn")
