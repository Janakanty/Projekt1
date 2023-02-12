extends Control

var stop_timer: bool = false

func _ready():
		$AnimationPlayer.play("invisible")
		Global.story = true
		get_node("Node").trigger_story_board()


func _on_Button_pressed():
		get_node("slides").advance(1.0) # podejrzane. Działa ale nie wiem dlaczego xD Trzeba mieć to na oku (tutaj robił tak aby animacje się dokańczały zanim wejdzie nowa. 
		stop_timer = false
		get_node("Node").trigger_story_board()
		$Timer.start()
		if get_node("Node").end_board == true:
				Global.story = false
				Global.moveing = false
				Global.casual_moveing = true
				queue_free()
				

func _on_Timer_timeout():
		if stop_timer == false:
				_on_Button_pressed()
				



