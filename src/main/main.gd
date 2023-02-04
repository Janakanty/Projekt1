extends Node2D

var

onready var player_canvas = get_node("player/Camera2D/CanvasLayer")

func _input(event):
		if(Input.is_action_just_pressed("quit")):
				get_tree().quit()

func _ready():
		gameplay_provider()


func gameplay_provider():
		if Global.start == false:
				start_game()

func start_game():
	
		player_canvas.get_node("story_board_big").visible = false
		
