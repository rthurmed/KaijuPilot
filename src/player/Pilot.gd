class_name Pilot
extends KinematicBody2D


onready var animation: AnimationPlayer = $AnimationPlayer
onready var sprite: Sprite = $Sprite
onready var state_machine: StateMachine = $StateMachine
onready var ground_raycast: RayCast2D = $GroundRayCast2D
onready var ground_raycast2: RayCast2D = $GroundRayCast2D2
onready var ground_raycast3: RayCast2D = $GroundRayCast2D3
onready var stuck_prevent_raycast: RayCast2D = $StuckPreventRayCast2D

var move: Vector2 = Vector2.ZERO
var kaiju: Kaiju = null

signal mounted
signal unmounted


func on_ground():
#	return is_on_floor()
	return (
		(
			ground_raycast.is_colliding() or 
			ground_raycast2.is_colliding() or
			ground_raycast3.is_colliding()
		) and not stuck_prevent_raycast.is_colliding()
		# Prevents player from getting stuck in one way collision nodes
	)


func mount(kaiju_path: NodePath):
	kaiju = get_node(kaiju_path)
	emit_signal("mounted")
	state_machine.transition("Mounted")


func unmount():
	emit_signal("unmounted")
	state_machine.transition("Walk")
	kaiju = null


func is_mounted():
	return kaiju != null
