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
	var frame = total_frames - floor(life.percent() * total_frames)
	if life.total <= 0:
		frame = total_frames - 1
	sprite.frame = frame


func _on_Life_death():
	collision.set_deferred("disabled", true)
	emit_signal("death")
	queue_free()
