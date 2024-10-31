extends Node2D

@onready var player_health = $Player.health

var has_glasses = true
var has_died = false
var has_lvl2_key = false
var ended_level = false
var has_checkpoint = false

var _starting_position = Vector2(10, -110)
var _checkpoint = Vector2(1300, -110)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if ended_level:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	if has_died:
		await get_tree().create_timer(1.0).timeout
		_respawn_player()
		has_died = false
	if has_lvl2_key:
		has_checkpoint = true
	pass


func _respawn_player():
	if has_died:
		if has_checkpoint:
			$Player.health = player_health
			$Player.position = _checkpoint
			$Player/AnimationTree['parameters/conditions/respawn'] = true
			$Player/AnimationTree['parameters/conditions/death'] = false
		else:
			$Player.health = player_health
			$Player.position = _starting_position
			$Player/AnimationTree['parameters/conditions/respawn'] = true
			$Player/AnimationTree['parameters/conditions/death'] = false
