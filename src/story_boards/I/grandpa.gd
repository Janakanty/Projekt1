extends Node

var end_board = false
var slide = 1 

func trigger_story_board():
		#1
		if slide == 1:
			slide += 1
			get_parent().get_node("slides").play("from0to1")
		#2 Ale nie wiedzieli
		elif slide == 2:
			slide += 1
			get_parent().get_node("slides").play("from1to2")
		#3
		elif slide == 3:
			slide += 1
			get_parent().get_node("slides").play("from2to3")
		#4
		elif slide == 4:
			slide += 1
			get_parent().get_node("slides").play("from3to4")
		#5
		elif slide == 5:
			slide += 1
			get_parent().get_node("slides").play("from4to5")
		#6
		elif slide == 6:
			slide += 1
			get_parent().get_node("slides").play("from5to6")
		#7
		elif slide == 7:
			slide += 1
			get_parent().get_node("slides").play("from6to7")
		#8
		elif slide == 8:
			slide += 1
			get_parent().get_node("slides").play("from7to8")
		#8
		elif slide == 9:
			slide += 1
			get_parent().get_node("slides").play("from8to9")
		else:
			end_board = true

func _on_Node_tree_exiting():
		Global.camera_control_start()
