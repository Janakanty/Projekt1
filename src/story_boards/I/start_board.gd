extends Node

var end_board = false
var slide = 1 

func trigger_story_board():
		#1
		if slide == 1:
			
			slide += 1
		#2 Ale nie wiedzieli
		elif slide == 2:
			get_parent().get_node("slides").play("from1to2")
			slide += 1
		#3
		elif slide == 3:
			get_parent().get_node("slides").play("from2to3")
			slide += 1
		#4
		elif slide == 4:
			end_board = true


func _on_Node_tree_exiting():
		Global.camera_control_start()
