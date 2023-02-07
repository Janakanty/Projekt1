extends Node

var end_board = false
var slide = 1 
var max_slide = 7
var animation_name: String = ""

func trigger_story_board():
		if slide != max_slide:
				animation_name = str("from" , (slide-1) , "to" ,slide)
				get_parent().get_node("slides").play(animation_name)
				slide += 1
		else:
				end_board = true


func _on_Node_tree_exiting():
		Global.camera_control_start()
