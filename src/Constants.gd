extends Node


const gravity_modifier = 16

var gravity: Vector2 = (
	ProjectSettings.get("physics/2d/default_gravity_vector") *
	ProjectSettings.get("physics/2d/default_gravity") *
	gravity_modifier
)
