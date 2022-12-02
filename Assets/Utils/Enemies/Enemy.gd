extends KinematicBody2D

export var speed = 64
export var health = 1
var gravity = 1200
var velocity = Vector2.ZERO
var direction = -1
var hitted = false

func _physics_process(delta: float) -> void:
	velocity.x = speed * direction
	velocity.y += gravity * delta
	
	if direction == 1:
		$Sprite.flip_h = false
	else: 
		$Sprite.flip_h = true
	
	if $RayCast2D_wall.is_colliding() or not $RayCast_floor.is_colliding():
		$RayCast2D_wall.scale.x *= -1
		direction *= -1
		$RayCast_floor.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity = move_and_slide(velocity)
	
func _ready():
	$RayCast_floor.position.x = $CollisionShape2D.shape.get_extents().x * direction


func _on_HitBox_body_entered(body: Player) -> void:
	get_node("HurtBox").monitoring = false
	get_node("HurtBox2").monitoring = false
	hitted =  true
	health -= 1
	body.motion.y -= 300
	yield(get_tree().create_timer(0.1), "timeout")
	hitted = false
	if health == 0:
		queue_free()
		get_node("HitBox/Collision").set_deferred("disabled", true)
		

func _on_HurtBox_body_entered(body: Player) -> void:
	body.hitted = true
	body.life -= 1
	body.removeHeart(body.life)
	body.motion.x -= 300
	yield(get_tree().create_timer(0.2), "timeout")
	body.hitted = false

func _on_HurtBox2_body_entered(body):
	body.hitted = true
	body.life -= 1
	body.removeHeart(body.life)
	body.motion.x += 300
	yield(get_tree().create_timer(0.2), "timeout")
	body.hitted = false
