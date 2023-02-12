extends Node

var end_board = false
var slide = 1 
var max_slide = 15
var animation_name: String = ""

func _ready():
		Global.music_start(1,"res://music/ambient.wav",2)
		Global.music_stop(2,8)
		

func trigger_story_board():
		if slide != max_slide:
				attributes()
				animation_name = str("from" , (slide-1) , "to" ,slide)
				get_parent().get_node("slides").play(animation_name)
				slide += 1
		else:
				end_board = true


func _on_Node_tree_exited():
	Global.camera_control_start_hause()
	
func attributes():
		match slide:
				
				3: 
						Global.music_start(3,"res://sounds/akt_I/otwierana butelka.wav",0)
				6:
						get_parent().stop_timer = true
				7:
						Global.music_start(3,"res://sounds/akt_I/papier_trzymanie.wav",0)
				8:
						get_parent().stop_timer = true
				14:
						get_parent().stop_timer = true
