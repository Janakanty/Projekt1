extends Node

var end_board = false
var slide = 1 
var max_slide = 9
var animation_name: String = ""

func _ready():
		Global.music_stop(1,2)
		Global.music_start(2,"res://music/baletnica.wav", 0)

func trigger_story_board():
		if slide != max_slide:
				attributes()
				animation_name = str("from" , (slide-1) , "to" ,slide)
				get_parent().get_node("slides").play(animation_name)
				slide += 1
		else:
				end_board = true

func _on_Node_tree_exited():
		Global.music_stop(2,2)
		Global.music_start(1,"res://music/ambient.wav", 2)
		Global.camera_control_start()


func attributes():
		match slide:
				8:
						get_parent().stop_timer = true
