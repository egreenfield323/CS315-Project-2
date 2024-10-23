extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

@onready var anim_tree = $AnimationTree

var facing = 1

var has_glasses = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim_tree['parameters/conditions/jump'] = true
	else:
		anim_tree['parameters/conditions/jump'] = false

	var direction := Input.get_axis("left", "right")

	#facing left
	if direction < 0 and facing == 1:
		self.scale.x *= -1
		facing = -1
		
	#facing right
	if direction > 0 and facing == -1:
		self.scale.x *= -1
		facing = 1
	
	if direction:
		velocity.x = direction * SPEED
		
		if is_on_floor():
			anim_tree['parameters/conditions/run'] = true
			anim_tree['parameters/conditions/idle'] = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			anim_tree['parameters/conditions/run'] = false
			anim_tree['parameters/conditions/idle'] = true
	
	if Input.is_action_just_pressed("attack"):
		anim_tree['parameters/conditions/attack'] = true
	else:
		anim_tree['parameters/conditions/attack'] = false

	move_and_slide()
	
func unlock_glasses():
	has_glasses = true
