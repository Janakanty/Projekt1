extends Node

# POCZĄTEK

var end_board = false
var slide = 1 
var max_slide = 6
var animation_name: String = ""

func trigger_story_board():
		if slide != max_slide:
				#get_parent().get_node("slides").advance(1.0)
				attributes()
				animation_name = str("from" , (slide-1) , "to" ,slide)
				get_parent().get_node("slides").play(animation_name)
				slide += 1
		else:
				end_board = true


func _on_Node_tree_exiting():
		Global.camera_control_start()


func attributes():
		match slide:
				2: 
						get_parent().stop_timer = true
				4:
						get_parent().stop_timer = true
				5:
						get_parent().stop_timer = true
