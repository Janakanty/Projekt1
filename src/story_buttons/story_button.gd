extends Node2D

var active = false

func _on_Area2D_input_event(viewport, event, shape_idx):
		if (event is InputEventMouseButton && event.pressed and Global.moveing == false and Global.story == false and active == true and Global.let_walking == true):
				get_parent().get_parent().get_parent().get_node("player").go_to(position)
				Global.moveing = true


func _on_Area2D_body_entered(body):
		if active == true:
				Global.last_tuch_build = name
				Global.moveing = false
				get_parent().get_parent().get_parent().gameplay_provider()
				get_node("Area2D").visible = false
				



func _on_Area2D_mouse_entered():
		pass
