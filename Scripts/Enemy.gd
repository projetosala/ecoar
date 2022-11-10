extends KinematicBody2D

export var speed = 64
export var health = 1
var gravity = 1200
var velocity = Vector2.ZERO
var direction = -1

func _physics_process(delta: float) -> void:
	velocity.x = speed * direction
	velocity.y += gravity * delta
	
	if direction == 1:
		$Sprite.flip_h = true
	else: 
		$Sprite.flip_h = false
	
	if $RayCast2D_wall.is_colliding() or not $RayCast_floor.is_colliding():
		$RayCast2D_wall.scale.x *= -1
		direction *= -1
		$RayCast_floor.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity = move_and_slide(velocity)
	
func _ready():
	$RayCast_floor.position.x = $CollisionShape2D.shape.get_extents().x * direction
