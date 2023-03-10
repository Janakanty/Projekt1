extends Node2D

var start_board = preload("res://src/story_boards/I/start_game/start_board.tscn")
var start_boardII = preload("res://src/story_boards/I/start_game/start_boardII.tscn")
var grandpa_board_small = preload("res://src/story_boards/I/grandparents/grandpa_board_small.tscn")
var hause_end = preload("res://src/story_boards/I/end_act_I/endhouse_board.tscn")
var end = preload("res://src/story_boards/I/end_act_I/end_first_chapter.tscn")

var tscns = {"grandma": "res://src/story_boards/I/grandparents/grandma_board.tscn",
			 "grandpa": "res://src/story_boards/I/grandparents/grandpa_board.tscn",
			 "theatre": "res://src/story_boards/I/fabric_theatre/theatre_board.tscn",
			 "fabric" : "res://src/story_boards/I/fabric_theatre/fabric_board.tscn",
			 "hause"  : "res://src/story_boards/I/end_act_I/endhouse_board.tscn"
			}


func _input(event):
		if(Input.is_action_just_pressed("quit")):
				get_tree().quit()


func _ready():
		gameplay_provider()
		Global.story = true
		$AnimationPlayer.play("stat")
		unactive_buttons()


func unactive_buttons():
		for i in get_node("level/places").get_children():
				i.active = false


func gameplay_provider():
		Global.black_board_in()
		if Global.start == false:
				start_game()
		elif Global.zero == 1:
				start_game_hause()
		else:
				match Global.act:
					1:
						if Global.paragraf == 1 and Global.last_tuch_build == "grandma":
								start_scene("grandma")
						elif Global.paragraf == 1 and Global.last_tuch_build == "medium":
								start_scene("grandpa")	
						elif Global.paragraf == 2 and Global.last_tuch_build == "theatre":
								start_scene("theatre")
								get_node("level/places/hause").active = true
								get_node("level/places/hause").get_node("Area2D").visible = true
						elif Global.paragraf == 2 and Global.last_tuch_build == "fabric":
								start_scene("fabric")
								get_node("level/places/hause").active = true
								get_node("level/places/hause").get_node("Area2D").visible = true
						elif Global.paragraf == 3 and Global.last_tuch_build == "hause":
								start_end_act_I_HOME()
						elif Global.paragraf == 4:
								start_end_post()
					2:pass
					3:pass


func start_game():
		yield(get_tree().create_timer(4), "timeout")
		var s_board = start_board.instance()
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)
		get_node("level/places/hause").active = true
		Global.start = true
		Global.zero = 1


func start_game_hause():
		yield(get_tree().create_timer(1), "timeout")
		var s_board = start_boardII.instance()
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)
		unactive_buttons()
		get_node("level/places/medium").active = true
		get_node("level/places/grandma").active = true
		Global.zero = 2


func start_scene(scene_name:String):
		yield(get_tree().create_timer(1), "timeout")
		var start_b = load(str(tscns[scene_name]))
		var s_board = start_b.instance()
		unactive_buttons()
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)
		if scene_name == "grandma" or scene_name == "grandpa":
			get_node("level/places/fabric").active = true
			get_node("level/places/theatre").active = true
		elif scene_name == "theatre" or scene_name == "fabric":
			get_node("level/places/hause").active = true
			print("aktywuje active hause")
			Global.paragraf = 3
		elif scene_name == "hause":
			get_node("level/places/post").active = true


func start_end_act_I_HOME():
		yield(get_tree().create_timer(1), "timeout")
		unactive_buttons()
		var s_board = hause_end.instance()
		get_node("level/places/post").active = true
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)
		Global.paragraf = 4
		Global.zero = 2

func start_end_post():
		yield(get_tree().create_timer(1), "timeout")
		var s_board = end.instance()
		unactive_buttons()
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)
		Global.paragraf = 5
		Global.zero = 2

func add_small_grandpa():
		#yield(get_tree().create_timer(2), "timeout")
		var s_board = grandpa_board_small.instance() 
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)

func add_small_end():
		var s_board = grandpa_board_small.instance() 
		get_node("player/Camera2D/CanvasLayer").add_child(s_board)

func camera_control_start():
		Global.let_walking = false
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $player.transform.get_origin(), $level/places/hause.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(1), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $level/places/hause.global_position, $player.transform.get_origin(), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		Global.black_board_out()
		Global.let_walking = true

func camera_control_start_hause():
		Global.let_walking = false
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $player.transform.get_origin(), $level/places/grandma.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(1), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $level/places/grandma.global_position, $level/places/medium.transform.get_origin(), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(1), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $level/places/medium.global_position, $player.transform.get_origin(), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		Global.black_board_out()
		Global.let_walking = true

func camera_control_after_grand():
		Global.let_walking = false
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $player.transform.get_origin(), $level/places/fabric.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(1), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $level/places/fabric.global_position, $level/places/theatre.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(1), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $level/places/theatre.global_position, $player.transform.get_origin(), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		Global.black_board_out()
		Global.let_walking = true
		

func camera_control_end():
		print("blablabla2")
		Global.let_walking = false
		var tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $player.transform.get_origin(), $level/places/post.global_position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		yield(get_tree().create_timer(1), "timeout")
		tween = get_node("Tween")
		tween.interpolate_property($player/Camera2D, "global_position", $level/places/post.global_position, $player.transform.get_origin(), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		Global.black_board_out()
		Global.let_walking = true

