extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
		$AnimationPlayer.play("invisible")
		Global.story = true


func _on_Button_pressed():
		Global.story = false
		Global.moveing = false
		Global.casual_moveing = true
		queue_free()



func _on_story_board_small_grandpa_tree_exited():
		Global.camera_control_after_grand()
		
