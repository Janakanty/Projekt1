extends Node

# DZIADEK

var end_board = false
var slide = 1 
var max_slide = 17
var animation_name: String = ""

func _ready():
		Global.music_stop(1,2)
		Global.music_start(2,"res://music/medium.wav", 0)

func trigger_story_board():
		attributes()
		if slide != max_slide:
				animation_name = str("from" , (slide-1) , "to" ,slide)
				get_parent().get_node("slides").play(animation_name)
				slide += 1
		else:
				end_board = true
				Global.paragraf = 2


func _on_Node_tree_exited():
		Global.music_stop(3,2)
		Global.music_start(1,"res://music/ambient.wav", 8)
		Global.grandpa_think()


func attributes():
		match slide:
				8:
						get_parent().stop_timer = true
				10:
						Global.music_stop(2,1)
				11:
						Global.music_start(3,"res://music/przyzwanie_dziadka.wav", 2)
				16:
						get_parent().stop_timer = true
