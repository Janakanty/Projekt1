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
		#8
		elif slide == 10:
			slide += 1
			get_parent().get_node("slides").play("from9to10")
		#8
		elif slide == 11:
			slide += 1
			get_parent().get_node("slides").play("from10to11")
		#8
		elif slide == 12:
			slide += 1
			get_parent().get_node("slides").play("from11to12")
		#8
		elif slide == 13:
			slide += 1
			get_parent().get_node("slides").play("from12to13")
		#8
		elif slide == 14:
			slide += 1
			get_parent().get_node("slides").play("from13to14")
		#8
		elif slide == 15:
			slide += 1
			get_parent().get_node("slides").play("from14to15")
		#8
		elif slide == 16:
			slide += 1
			get_parent().get_node("slides").play("from15to16")
			#8
		elif slide == 17:
			slide += 1
			get_parent().get_node("slides").play("from16to17")	
		else:
			end_board = true
			Global.paragraf = 2


func _on_Node_tree_exited():
		Global.grandpa_think()
