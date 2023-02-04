extends Node

var end_board = false
var slide = 1 

func trigger_story_board():
		#1
		
		#2
		
		#3
		
		#4
		
		#5
		
		#6
		get_parent().get_node("AnimationPlayer").play("end_and_start")
		end_board = true


func _on_AnimationPlayer_animation_finished(anim_name):
	if end_board == true:
		get_parent().queue_free()
