extends Node2D

@export var follow_target : Node2D

# Init this variable as you'd like.
var _last_position : Vector2 = Vector2(50, -150)

func _physics_process(delta : float) -> void:
  if follow_target == null: return
  self.global_position = _last_position + Vector2(0, 50)

  _last_position = follow_target.global_position
