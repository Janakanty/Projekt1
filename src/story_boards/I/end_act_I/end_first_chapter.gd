extends Node

var end_board = false
var slide = 1 
var max_slide = 5
var animation_name: String = ""


func _ready():
		Global.music_stop(1,2)

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
				2: 
						Global.music_start(3,"res://music/poczta.wav",3)
				4:
						get_parent().stop_timer = true
						get_parent().get_node("Button").visible = false


func _on_Node_tree_exited():
		pass
