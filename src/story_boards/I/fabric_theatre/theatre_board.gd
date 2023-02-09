extends Node

var end_board = false
var slide = 1 
var max_slide = 9
var animation_name: String = ""

func _ready():
		Global.music_stopp()
		get_tree().root.get_node("main/music_machine").play_music(2,"res://music/baletnica.wav", 0)

func trigger_story_board():
		if slide != max_slide:
				animation_name = str("from" , (slide-1) , "to" ,slide)
				get_parent().get_node("slides").play(animation_name)
				slide += 1
		else:
				end_board = true

func _on_Node_tree_exited():
		Global.music_startt()
		Global.camera_control_start()
