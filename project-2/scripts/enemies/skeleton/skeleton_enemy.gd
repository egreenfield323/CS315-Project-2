extends StaticBody2D

@export var speed = 0.1
@onready var anim_tree = $AnimationTree
@export var health = 1

var hitable = true
var dead = false

var right_scale = scale.x
var left_scale = -scale.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	if get_parent() is PathFollow2D:
		follow_path(delta)
	pass

func follow_path(delta):
	if !dead:
		anim_tree['parameters/conditions/walk'] = true
		
		$"..".progress_ratio += delta * speed
		
		if $"..".progress_ratio > .5:
			scale.x = left_scale
		elif $"..".progress_ratio < .5:
			scale.x = right_scale

func is_hitable():
	return hitable
	
func hit(amount: int):
	health -= amount
	if health == 0:
		dead = true
		print("skeleton died")
		anim_tree['parameters/conditions/death'] = true
