extends Node2D

var start_board = preload("res://src/story_boards/I/start_board.tscn")


func _input(event):
		if(Input.is_action_just_pressed("quit")):
				get_tree().quit()
		if Input.is_action_just_pressed("ui_down"):
			print(Global.moveing)
			print(Global.story)

func _ready():
		gameplay_provider()
		Global.story = true
		$AnimationPlayer.play("stat")


func gameplay_provider():
		if Global.start == false:
				start_game()
		else:
				match Global.act:
					1:pass
					2:pass
					3:pass


func start_game():
		yield(get_tree().create_timer(4), "timeout")
		var s_board = start_board.instance()
		s_board.modulate.a = 0
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)
		Global.start == true


func camera_control_start():
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "position", $player.position, $level/places/story_button.position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(2), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "position", $level/places/story_button.position, $player.position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func camera_control_paragraf1():
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "position", $player.position, $level/places/story_button.position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(2), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "position", $level/places/story_button.position, $player.position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		
func camera_control_paragraf21():
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "position", $player.position, $level/places/story_button.position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(2), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "position", $level/places/story_button.position, $player.position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func camera_control_paragraf22():
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "position", $player.position, $level/places/story_button.position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(2), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "position", $level/places/story_button.position, $player.position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
