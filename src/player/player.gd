extends KinematicBody2D

var velocity = Vector2() setget moving_animation
var speed = 50
var move = false

func _physics_process(delta):
		self.velocity = move_and_slide(velocity)

func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
		get_input()


func moving_animation(new_velocity):  #walk animation when - walk
		velocity = new_velocity
		if velocity != Vector2(0,0):
				pass#$AnimatedSprite.play("moving")
		else: 
				pass#$AnimatedSprite.stop()
