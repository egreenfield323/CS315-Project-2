extends Area2D

@export var speed = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	if get_parent() is PathFollow2D:
		follow_path(delta)
	pass

func follow_path(delta):
	$"..".progress_ratio += delta * speed
	
	if $"..".progress_ratio > .5:
		scale.x = 1
	elif $"..".progress_ratio < .5:
		scale.x = -1
