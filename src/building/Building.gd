class_name Building
extends KinematicBody2D


onready var sprite: Sprite = get_node("Sprite")
onready var life: Life = get_node("Life")

var total_frames = 4


func _ready():
	var _ok = life.connect("damage", self, "_on_Life_damage")


func _on_Life_damage(_damage):
	sprite.frame = total_frames - floor(life.percent() * total_frames)
	if life.total <= 0:
		sprite.frame = total_frames - 1
