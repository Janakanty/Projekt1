extends Node

var end_board = false
var slide = 1 
var max_slide = 9
var animation_name: String = ""

func trigger_story_board():
		if slide != max_slide:
				animation_name = str("from" , (slide-1) , "to" ,slide)
				get_parent().get_node("slides").play(animation_name)
				slide += 1
		else:
				end_board = true

func trigger_story_board2():
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
		#5
		elif slide == 6:
			slide += 1
			get_parent().get_node("slides").play("from5to6")
				#5
		elif slide == 7:
			slide += 1
			get_parent().get_node("slides").play("from6to7")
				#5
		elif slide == 8:
			slide += 1
			get_parent().get_node("slides").play("from7to8")
		else:
			end_board = true


func _on_Node_tree_exited():
		Global.camera_control_start()
