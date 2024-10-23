extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var player = get_parent().get_parent().get_node("Player")
	if body == player and player.has_glasses:
		$Label.visible = true
	pass # Replace with function body.
	

func _on_body_exited(body: Node2D) -> void:
	var player = get_parent().get_parent().get_node("Player")
	if body == player and player.has_glasses:
		$Label.visible = false
	pass # Replace with function body.
