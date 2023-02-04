extends Node2D


func _on_Area2D_input_event(viewport, event, shape_idx):
		if (event is InputEventMouseButton && event.pressed and Global.moveing == false and Global.story == false):
				get_parent().get_parent().get_parent().get_node("player").go_to(position)
				Global.moveing = true
				print()


func _on_Area2D_body_entered(body):
		Global.moveing = false
		get_parent().get_parent().get_parent().gameplay_provider()
		get_node("Area2D").visible = false


