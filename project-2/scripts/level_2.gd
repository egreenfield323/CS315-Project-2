extends Node2D

var has_glasses = true
var has_died = false
var has_lvl2_key = false
var ended_level = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if ended_level:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	pass
