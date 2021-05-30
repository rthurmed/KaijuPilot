extends Node2D


export var path_sprite: NodePath
export var initial_frame: String

var sprite: Sprite
var last_frame: int = 0


func _ready():
	sprite = get_node(path_sprite)
	var _err = sprite.connect("frame_changed", self, "_on_Sprite_frame_changed")
	
	for child in get_children():
		update_collision_frame(child.name, false)
	
	if initial_frame:
		update_collision_frame(initial_frame, true)


func has_collision_frame(frame: String):
	return has_node(frame)


func update_collision_frame(frame: String, enabled: bool):
	if not has_collision_frame(frame): return
	
	var collision_frame = get_node(frame)
	collision_frame.visible = enabled
	
	for collider in collision_frame.get_children():
		collider.set_deferred("disabled", not enabled)


func _on_Sprite_frame_changed():
	update_collision_frame(str(last_frame), false)
	update_collision_frame(str(sprite.frame), true)
	last_frame = sprite.frame
