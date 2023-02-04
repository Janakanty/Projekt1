extends KinematicBody2D

var destination = Vector2()
var movement = Vector2()
var speed = 100
var moveing = false

func _physics_process(delta):
		movement()

func go_to(x):
		destination = x

func movement():
		if moveing == true:
				movement = position.direction_to(destination) * speed
				movement = move_and_slide(movement)
