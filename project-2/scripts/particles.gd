extends Node2D

@export var rock_hit_particle: Resource

var particle_names = [
	"rock_hit_particle"
]

func play_particle(name: String, position: Vector2):
	var particle
	if particle_names.has(name):
		if (name == "rock_hit_particle"):
			particle = rock_hit_particle.instantiate()
			particle.position = position
			add_child(particle)
			_emit(particle)
			
func _emit(particle: GPUParticles2D):
	particle.emitting = true
	await get_tree().create_timer(particle.lifetime).timeout
	particle.queue_free()
