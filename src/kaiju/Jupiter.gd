extends KinematicBody2D


func _ready():
	$Flip/AnimationPlayer.play("walk")
