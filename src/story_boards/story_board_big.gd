extends Control

func _ready():
		$AnimationPlayer.play("invisible")
		Global.story = true


func _on_Button_pressed():
		if get_node("Node").end_board == true:
				Global.story = false
				Global.moveing = false
				Global.casual_moveing = true	
				queue_free()
		get_node("Node").trigger_story_board()


