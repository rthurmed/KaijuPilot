class_name Building
extends KinematicBody2D


onready var sprite: Sprite = get_node("Sprite")
onready var life: Life = get_node("Life")
onready var collision: CollisionShape2D = get_node("CollisionShape2D")

var total_frames = 4

signal death


func _ready():
	var _ok = life.connect("damage", self, "_on_Life_damage")
	var _ok1 = life.connect("death", self, "_on_Life_death")


func _on_Life_damage(_damage):
	sprite.frame = total_frames - floor(life.percent() * total_frames)
	if life.total <= 0:
		sprite.frame = total_frames - 1


func _on_Life_death():
	collision.disabled = true
	emit_signal("death")
