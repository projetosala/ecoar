extends Area2D
class_name Detection_Area

export(NodePath) onready var enemy = get_node("Enemy") as KinematicBody2D



func on_body_entered(body: Player) -> void:
	enemy.player_ref = body

func on_body_exited(_body: Player) -> void:
	enemy.player_ref = null

