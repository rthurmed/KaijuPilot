extends Control


onready var animation = $AnimationPlayer


func _ready():
	animation.play("start")


func _process(_delta):
	if Input.is_action_just_released("reset"):
		var _status = get_tree().change_scene("res://src/Main.tscn")
