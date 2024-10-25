extends StaticBody2D

@export var hitable = true
@export var health = 3

@export var rock_hit_particles: Resource


func get_health():
	return health

func hit(hitpoints: int):
	health -= hitpoints
	var hit_particle = rock_hit_particles.instantiate()
	add_child(hit_particle)
	hit_particle.emitting = true
	
	if (health <= 0):
		queue_free()
	
func is_hitable():
	return hitable
