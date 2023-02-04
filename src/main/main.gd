extends Node2D

var start_board = preload("res://src/story_boards/I/start_board.tscn")


func _input(event):
		if(Input.is_action_just_pressed("quit")):
				get_tree().quit()

func _ready():
		gameplay_provider()
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
		yield(get_tree().create_timer(2), "timeout")
		var s_board = start_board.instance()
		s_board.modulate.a = 0
		get_node("Camera2D/CanvasLayer").add_child(s_board)
		Global.start == true
		
