extends Node


var end_board = false
var slide = 1 
var max_slide = 2
var animation_name: String = ""


func _ready():
		pass

func trigger_story_board():
		if slide != max_slide:
				attributes()
				animation_name = str("from" , (slide-1) , "to" ,slide)
				get_parent().get_node("slides").play(animation_name)
				slide += 1
		else:
				end_board = true

func attributes():
		match slide:
				1: 
						get_parent().stop_timer = true


func _on_Node_tree_exited():
		Global.camera_control_after_end_hause()
		#camera 
