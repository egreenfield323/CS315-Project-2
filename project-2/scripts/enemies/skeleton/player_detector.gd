extends Area2D

@onready var enemy_speed = $"..".speed

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_parent().speed = 0
		get_parent().get_node("AnimationTree")['parameters/conditions/attack'] = true
	pass

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_parent().speed = enemy_speed
		get_parent().get_node("AnimationTree")['parameters/conditions/attack'] = false
	pass # Replace with function body.
