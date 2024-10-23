extends Area2D


func _on_body_entered(body: Node2D) -> void:
	var player = get_parent().get_node("Player")
	if body == player:
		player.unlock_glasses()
		queue_free()
	pass # Replace with function body.
