extends Node2D

var start_board = preload("res://src/story_boards/story_board_small.tscn")

onready var player_canvas = get_node("player/Camera2D/CanvasLayer")

func _input(event):
		if(Input.is_action_just_pressed("quit")):
				get_tree().quit()

func _ready():
		gameplay_provider()
		$AnimationPlayer.play("start")
		Global.story = true


func gameplay_provider():
		if Global.start == false:
				start_game()
		else:
				match Global.act:
					1:pass
					2:pass
					3:pass


func start_game():
		yield($AnimationPlayer, "animation_finished")
		var s_board = start_board.instance()
		s_board.modulate.a = 0
		player_canvas.add_child(s_board)
		Global.start == true
		
