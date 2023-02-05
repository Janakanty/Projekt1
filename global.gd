extends Node

#GAMEPLAY
var story:          bool = false
var moveing:        bool = false
var casual_moveing: bool = false

#FABUA
var act:      int = 1
var start:    bool = false
var paragraf: int = 1
var zero = 0 
var last_tuch_build = ""
#WSPOMAGACZE 

func camera_control_start():
	get_parent().get_node("main").camera_control_start()
	
func camera_control_start_hause():
	get_parent().get_node("main").camera_control_start_hause()
	
func music_in():
	get_parent().get_node("main").music_fade_in(get_parent().get_node("main").get_node("ambient"))
