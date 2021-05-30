class_name Jupiter
extends Kaiju


onready var flip = $Flip
onready var animation = $Flip/AnimationPlayer
onready var viewing_area = $Flip/ViewingArea
onready var mount_point = $Flip/MountArea
onready var state_machine = $StateMachine


var seeking_enemy = false


func _on_Life_death():
	mount_point.call_unmount()
	queue_free()
