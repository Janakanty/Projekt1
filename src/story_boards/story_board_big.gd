extends Control

func _ready():
		$AnimationPlayer.play("invisible")
		Global.story = true


func _on_Button_pressed():
		get_node("Node").trigger_story_board()
		$Timer.start()
		if get_node("Node").end_board == true:
				Global.story = false
				Global.moveing = false
				Global.casual_moveing = true
				queue_free()
				

func _on_Timer_timeout():
	_on_Button_pressed()
