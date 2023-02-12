extends Node

# BABCIA

var animation_name: String = ""
var end_board = false
var slide = 1 
var max_slide = 16

func _ready():
		Global.music_stop(1,1)
		Global.music_start(2,"res://music/babka1.wav",0)

func trigger_story_board():
		if slide != max_slide:
				attributes()
				animation_name = str("from" , (slide-1) , "to" ,slide)
				get_parent().get_node("slides").play(animation_name)
				slide += 1
		else:
				end_board = true
				Global.paragraf = 2


func _on_Node_tree_exited():
	Global.music_stop(2,4)
	Global.music_start(1,"res://music/ambient.wav",4)
	Global.grandpa_think()


func attributes():
		match slide:
				1:
						Global.music_start(3,"res://sounds/akt_I/drzwi.wav",0)
				9:
						get_parent().stop_timer = true
				15:
						get_parent().stop_timer = true
