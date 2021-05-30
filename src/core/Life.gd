class_name Life
extends Node2D


onready var progress: TextureProgress = $UI/TextureRect/TextureProgress
onready var animation: AnimationPlayer = $AnimationPlayer

export var total: int = 100
export var value: int = 100

var alive = true
var immune = false

signal damage(amount)
signal death


func _ready():
	if total < value:
		push_error("FAILED LIFE CONTAINER: Value must be lower than total")
	
	progress.max_value = total
	progress.value = value


func percent() -> float:
	return value / float(total)


func hit(amount: int):
	if immune: return
	
	value = value - amount
	emit_signal("damage", amount)
	
	progress.value = value
	animation.seek(0, true)
	animation.play("show")
	
	if value <= 0:
		emit_signal("death")
		progress.value = 0
		alive = false
