extends KinematicBody2D
class_name Enemy

signal kill 

onready var sprite: Sprite = get_node("Sprite")
onready var ray: RayCast2D = get_node("FRay")
onready var anim: AnimationPlayer = get_node("Animation")

var can_die: bool = false
var can_hit: bool = false
var can_attack: bool = false

var velocity: Vector2
var player_ref: Player = null

export(int) var damage = 0
export(int) var speed = 10
export(int) var gravity_speed = 10
export(int) var proximity_threshold = 0
export(int) var raycast_default_position = 0

func _physics_process(delta: float) -> void:
	gravity(delta)
	move_behavior()
	verify_position()
	velocity = move_and_slide(velocity, Vector2.UP)
	
func move_behavior() -> void:
	if player_ref != null:
		var distance: Vector2 = player_ref.global_position - global_position
		var direction: Vector2 = distance.normalized()
		if abs(distance.x) <= proximity_threshold:
			velocity.x = 0
			can_attack = true
		elif floor_collision() and not can_attack:
			velocity.x = direction.x * speed
			
		return
	
	velocity.x = 0

func gravity(delta: float) -> void:
	velocity.y += delta * gravity_speed
	
func floor_collision() -> bool:
	if ray.is_colliding():
		return true
		
	return false
	
func verify_position() -> void:
	if player_ref != null:
		var direction: float = sign(player_ref.global_position.x - global_position.x)
		
		if direction > 0:
			sprite.flip_h = false
			ray.position.x = abs(raycast_default_position)
		elif direction < 0:
			sprite.flip_h = true
			ray.position.x = (raycast_default_position)
