extends KinematicBody2D
class_name Player
export var canMove = true

var motion = Vector2()
const up = Vector2(0,-1)
const gravity = 20
export var acceleration = 30
export var max_speed = 145
export var jump_height = -500
var life = 3
var hitted = false

func removeHeart(life):
	if life == 2:
		$heart.play("heart_black")
	elif life == 1:
		pass
		$heart2.play("heart_black")
	else:
		$heart3.play("heart_black")
		get_tree().reload_current_scene()
		
func _physics_process(delta):
	motion.y += gravity
	var friction = false
	if canMove == true:
		if Input.is_action_pressed("ui_right"):
			$AnimatedSprite.flip_h = false
			motion.x = min(motion.x+acceleration, max_speed)
			$AnimatedSprite.play("run")
			
		elif Input.is_action_pressed("ui_left"):
			motion.x = max(motion.x-acceleration, -max_speed)
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("run")
		else:
			friction = true
			$AnimatedSprite.play("idle")
		if is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				motion.y = jump_height
			if friction == true:
				motion.x = lerp(motion.x, 0,0.2)
		else:
			if motion.y > 0:
				$AnimatedSprite.play("fall")
			else:
				$AnimatedSprite.play("jump")
			if friction == true:
				motion.x = lerp(motion.x, 0,0.05)
		if Input.is_action_pressed("ui_home"):
			get_tree().paused = true
			$pause/pausada.visible = true
			
			
	motion = move_and_slide(motion, up)
	

