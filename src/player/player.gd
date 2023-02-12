extends KinematicBody2D

var destination = Vector2()
var movement = Vector2()
var speed = 300

func _physics_process(delta):
		if Global.let_walking == true:
				movement()
				casual_movement()

func go_to(x):
		destination = x

func casual_movement():
		if Input.is_action_pressed("left_click") and Global.moveing == false and Global.casual_moveing == true and Global.story == false:
				movement = position.direction_to(get_global_mouse_position()) * speed 
				movement = move_and_slide(movement)

func movement():
		if Global.moveing == true and Global.story == false:
				movement = position.direction_to(destination) * speed 
				movement = move_and_slide(movement)
				

func bars_in():
		$black_bars.play("bars_in_camera")
		
func bars_out():
		$black_bars.play("bars_out_camera")
