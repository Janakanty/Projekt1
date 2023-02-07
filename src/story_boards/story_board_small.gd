extends Control

func _ready():
		$AnimationPlayer.play("invisible")
		Global.story = true


func _on_Button_pressed():
		Global.story = false
		Global.moveing = false
		Global.casual_moveing = true
		queue_free()

