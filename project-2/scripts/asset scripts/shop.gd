extends Area2D

var standing_in_zone = false

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if $"../..".has_lvl1_key:
			$Label.visible = true
			standing_in_zone = true
	pass
	
func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
			standing_in_zone = false
			$Label.visible = false
	pass
	
func _process(_delta):
	if standing_in_zone:
		if Input.is_action_just_pressed("attack"):
			_end_level()
			

func _end_level():
	if !$"../..".ended_level:
		$"../..".ended_level = true
		$"../../Particles".play_particle("collect_key_particle", $"../../Player".position)
