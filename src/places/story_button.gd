extends Node2D


func _on_Area2D_input_event(viewport, event, shape_idx):
		if (event is InputEventMouseButton && event.pressed and get_parent().get_parent().get_parent().get_node("player").moveing == false):
				get_parent().get_parent().get_parent().get_node("player").go_to(position)
				get_parent().get_parent().get_parent().get_node("player").moveing = true
				


func _on_Area2D_body_entered(body):
		body.moveing = false
		get_node("Area2D").visible = false

