extends Node2D

var start_boardII = preload("res://src/story_boards/I/start_boardII.tscn")
var start_board = preload("res://src/story_boards/I/start_board.tscn")
var grandpa_board = preload("res://src/story_boards/I/grandpa_board.tscn")
var grandma_board


func _input(event):
		if(Input.is_action_just_pressed("quit")):
				get_tree().quit()
		if Input.is_action_just_pressed("ui_down"):
			print(Global.start)


func _ready():
		gameplay_provider()
		Global.story = true
		$AnimationPlayer.play("stat")
		unactive_buttons()

func unactive_buttons():
		for i in get_node("level/places").get_children():
				i.active = false

func gameplay_provider():
		if Global.start == false:
				start_game()
		elif Global.zero == 1:
				start_game_hause()
		else:
				match Global.act:
					1:
						if Global.paragraf == 1 and Global.last_tuch_build == "grandma":
								start_grandma()
						elif Global.paragraf == 1 and Global.last_tuch_build == "medium":
								start_grandpa()

							
					2:pass
					3:pass


func start_game():
		yield(get_tree().create_timer(3), "timeout")
		var s_board = start_board.instance()
		s_board.modulate.a = 0
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)
		get_node("level/places/hause").active = true
		Global.start = true
		Global.zero = 1

func start_game_hause():
		yield(get_tree().create_timer(2), "timeout")
		var s_board = start_boardII.instance()
		s_board.modulate.a = 0
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)
		get_node("level/places/medium").active = true
		get_node("level/places/grandma").active = true
		Global.zero = 2
		music_fade_out($scena0)
		music_fade_out($scena0)

func start_grandma():
		yield(get_tree().create_timer(2), "timeout")
		var s_board = start_boardII.instance()
		s_board.modulate.a = 0
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)
		get_node("level/places/medium").active = true
		get_node("level/places/grandma").active = true
		Global.zero = 2

func start_grandpa():
		yield(get_tree().create_timer(2), "timeout")
		var s_board = grandpa_board.instance()
		s_board.modulate.a = 0
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)
		get_node("level/places/medium").active = true
		get_node("level/places/grandma").active = true
		Global.zero = 2

func camera_control_start():
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $player.global_position, $level/places/hause.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(2), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $level/places/hause.global_position, $player.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func camera_control_start_hause():
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $player.global_position, $level/places/grandma.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(2), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $level/places/grandma.global_position, $level/places/medium.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(2), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $level/places/medium.global_position, $player.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		
func camera_control_paragraf21():
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $player.global_position, $level/places/story_button.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(2), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "position", $level/places/story_button.position, $player.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func camera_control_paragraf22():
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $player.global_position, $level/places/story_button.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(2), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $level/places/story_button.global_position, $player.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func music_fade_out(var x):
		var music_tween = get_node("MusicTween")
		music_tween.interpolate_property(x, "volume_db", 0, -80, 8, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		music_tween.start()
		
func music_fade_in(var x):
		var music_tween = get_node("MusicTween")
		music_tween.interpolate_property(x, "volume_db", -80, 0,  8, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		music_tween.start()

