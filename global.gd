extends Node

#GAMEPLAY
var story:          bool = false
var moveing:        bool = false
var casual_moveing: bool = false
var let_walking:    bool = true

#FABUA
var start:    bool = false
var act:       int = 1
var paragraf:  int = 1
var zero:      int = 0
var last_tuch_build = ""

#WYWOŁANIA PORUSZANIA KAMERY
func camera_control_start():
	get_parent().get_node("main").camera_control_start()

func camera_control_start_hause():
	get_parent().get_node("main").camera_control_start_hause()

func camera_control_after_grand():
	get_parent().get_node("main").camera_control_after_grand()
	
func camera_control_after_end_hause():
	get_parent().get_node("main").camera_control_end()


# MAŁA TABLICA 
func camera_control_after_end_act():
	get_parent().get_node("main").add_small_end()
	


func grandpa_think():
	get_parent().get_node("main").add_small_grandpa()

#MUZYKA
func music_start(chanel, path, time):
	get_parent().get_node("main/music_machine").play_music(chanel, path, time)

func music_stop(chanel, time):
	get_parent().get_node("main/music_machine").stop_music(chanel, time)

func black_board_in():
	get_parent().get_node("main/player").bars_in()

func black_board_out():
	get_parent().get_node("main/player").bars_out()
