extends Node

#GAMEPLAY
var story:          bool = false
var moveing:        bool = false
var casual_moveing: bool = false

#FABUA
var act:      int = 1
var start:    bool = false
var paragraf: int = 1

#WSPOMAGACZE 

func camera_control_start():
	get_parent().get_node("main").camera_control_start()
