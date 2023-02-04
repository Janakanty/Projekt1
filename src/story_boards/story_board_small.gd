extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
		$AnimationPlayer.play("invisible")
		Global.story = true


func _on_Area2D_input_event(viewport, event, shape_idx):
		if (event is InputEventMouseButton && event.pressed):
				print("dd")
				Global.story = false
				Global.moveing = false
				Global.casual_moveing = true
				queue_free()


