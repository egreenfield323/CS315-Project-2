extends Node2D

var has_glasses = false
var has_died = false
var has_lvl1_key = false
var ended_level = false

var has_checkpoint = false

var _starting_position = Vector2(10, -120)
var _checkpoint = Vector2(2600, -180)

@onready var player_health = $Player.health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ended_level:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	if has_died:
		await get_tree().create_timer(1.0).timeout
		_respawn_player()
		has_died = false
	pass


func _on_return_key_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if has_lvl1_key:
			has_checkpoint = true
			$Directions/return_key/Label.visible = true
	
	pass # Replace with function body.


func _on_return_key_body_exited(body: Node2D) -> void:
	$Directions/return_key/Label.visible = false
	pass # Replace with function body.

func _respawn_player():
	if has_died:
		if has_checkpoint:
			$Player.health = player_health
			$Player.position = _checkpoint
			$Player/AnimationTree['parameters/conditions/death'] = false
			$Player/AnimationTree['parameters/conditions/respawn'] = true
			
		else:
			$Player.health = player_health
			$Player.position = _starting_position
			$Player/AnimationTree['parameters/conditions/death'] = false
			$Player/AnimationTree['parameters/conditions/respawn'] = true
