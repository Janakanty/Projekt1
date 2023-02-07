extends Node

var end_board = false
var slide = 1 
var max_slide = 17
var animation_name: String = ""

func trigger_story_board():
		if slide != max_slide:
				animation_name = str("from" , (slide-1) , "to" ,slide)
				get_parent().get_node("slides").play(animation_name)
				slide += 1
		else:
				end_board = true

func trigger_story_board2():
		if slide == 1:
			slide += 1
			get_parent().get_node("slides").play("from0to1")
		elif slide == 2:
			slide += 1
			get_parent().get_node("slides").play("from1to2")
		elif slide == 3:
			get_parent().get_node("slides").play("from2to3")
			slide += 1
		elif slide == 4:
			get_parent().get_node("slides").play("from3to4")
			slide += 1
		elif slide == 5:
			get_parent().get_node("slides").play("from4to5")
			slide += 1
		elif slide == 6:
			get_parent().get_node("slides").play("from5to6")
			slide += 1
		elif slide == 7:
			get_parent().get_node("slides").play("from6to7")
		elif slide == 8:
			slide += 1
			get_parent().get_node("slides").play("from7to8")
		elif slide == 9:
			slide += 1
			get_parent().get_node("slides").play("from8to9")
		elif slide == 10:
			slide += 1
			get_parent().get_node("slides").play("from9to10")
		elif slide == 11:
			slide += 1
			get_parent().get_node("slides").play("from10to11")
		elif slide == 12:
			slide += 1
			get_parent().get_node("slides").play("from11to12")
		elif slide == 13:
			slide += 1
			get_parent().get_node("slides").play("from12to13")
		elif slide == 14:
			slide += 1
			get_parent().get_node("slides").play("from13to14")
		elif slide == 15:
			slide += 1
			get_parent().get_node("slides").play("from14to15")
		elif slide == 16:
			slide += 1
			get_parent().get_node("slides").play("from15to16")
		else:
			end_board = true


func _on_Node_tree_exited():
	Global.camera_control_start_hause()
	
