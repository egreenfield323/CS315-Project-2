extends Node2D

@onready var player_health = $"../Player".health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = $"../Player".position.x
	position.y = $"../Player".position.y + 125
	
	player_health = $"../Player".health
	
	if player_health == 5:
		$VBoxContainer/Sprite2D2.scale = Vector2(1, 1)
		$VBoxContainer/Sprite2D2.position.x = -0.475
	elif player_health == 4:
		$VBoxContainer/Sprite2D2.scale.x = 0.8
		$VBoxContainer/Sprite2D2.position.x = -5.35
	elif player_health == 3:
		$VBoxContainer/Sprite2D2.scale.x = 0.64
		$VBoxContainer/Sprite2D2.position.x = -9.255
	elif player_health == 2:
		$VBoxContainer/Sprite2D2.scale.x = 0.5
		$VBoxContainer/Sprite2D2.position.x = -12.705
	elif player_health == 1:
		$VBoxContainer/Sprite2D2.scale.x = 0.3
		$VBoxContainer/Sprite2D2.position.x = -17.605
	elif player_health == 0:
		$VBoxContainer/Sprite2D2.scale.x = 0
		$VBoxContainer/Sprite2D2.position.x = -20
	
	pass
