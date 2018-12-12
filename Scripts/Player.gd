extends KinematicBody2D

export var World_Limit = 3000

const SPEED = 700
const JUMP_SPEED = -1500
const GRAVITY = 2600
var motion = Vector2()
var UP = Vector2(0,-1)

func _physics_process(delta):
	update_movement(delta)
	pass

func _process(delta):
	update_animation()
	pass

func update_animation():
	$AnimatedSprite.update(motion)
	pass
	
func update_movement(d):
	fall(d)
	move()
	move_and_slide(motion, UP)
	pass

func fall(d):
	if is_on_floor() or is_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY * d
	
	if position.y > World_Limit:
		end_game()
	pass

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	pass

func move():
	var input_left = Input.is_action_pressed("ui_left")
	var input_right = Input.is_action_pressed("ui_right")
	var input_up = Input.is_action_pressed("ui_up")
	
	if input_right && !input_left:
		motion.x = SPEED
	elif input_left && !input_right:
		motion.x = -SPEED
	else:
		motion.x = 0
	
	if is_on_floor() && input_up:
		motion.y = JUMP_SPEED
	pass

