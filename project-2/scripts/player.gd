extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

@onready var anim_tree = $AnimationTree
@onready var bg1_anim = get_parent().get_node("bg/bg1_animation")
@onready var bg2_anim = get_parent().get_node("bg/bg2_animation")
@onready var bg3_anim = get_parent().get_node("bg/bg3_animation")


@export var BG_SPEED_SCALE = 0.8

var facing = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	_play_bgs()
	
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
		_resume_bgs()
		
		facing = -1
		
	#facing right
	if direction > 0 and facing == -1:
		self.scale.x *= -1
		_resume_bgs()

		facing = 1
	
	if direction:
		velocity.x = direction * SPEED
		
		if is_on_floor():
			anim_tree['parameters/conditions/run'] = true
			anim_tree['parameters/conditions/idle'] = false
	else:
		if (_pause_bgs()):
			_resume_bgs()
		
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			anim_tree['parameters/conditions/run'] = false
			anim_tree['parameters/conditions/idle'] = true
	
	if Input.is_action_just_pressed("attack"):
		anim_tree['parameters/conditions/attack'] = true
	else:
		anim_tree['parameters/conditions/attack'] = false


	move_and_slide()
func _play_bgs():
	if !bg1_anim.is_playing():
		bg1_anim.play("move bg1")
		bg2_anim.play("move bg2")
		bg3_anim.play("move bg3")
		return false
	else:
		return true

func _pause_bgs():
	if bg1_anim.speed_scale != 0:
		bg1_anim.speed_scale = 0
		bg2_anim.speed_scale = 0
		bg3_anim.speed_scale = 0

func _resume_bgs():
	if facing == 1:
		bg1_anim.speed_scale = -1
		bg2_anim.speed_scale = -1
		bg3_anim.speed_scale = -1
	else:
		bg1_anim.speed_scale = BG_SPEED_SCALE
		bg2_anim.speed_scale = BG_SPEED_SCALE
		bg3_anim.speed_scale = BG_SPEED_SCALE
	
