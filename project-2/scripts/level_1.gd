extends Node2D

var has_glasses = false
var has_died = false
var has_lvl1_key = false
var ended_level = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ended_level:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	pass


func _on_return_key_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if has_lvl1_key:
			$Directions/return_key/Label.visible = true
	
	pass # Replace with function body.


func _on_return_key_body_exited(body: Node2D) -> void:
	$Directions/return_key/Label.visible = false
	pass # Replace with function body.
