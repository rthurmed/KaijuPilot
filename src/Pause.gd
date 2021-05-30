extends CanvasLayer


onready var ui = $UI


func _input(event):
	if event.is_action_released("pause"):
		get_tree().paused = not get_tree().paused
		ui.visible = get_tree().paused
