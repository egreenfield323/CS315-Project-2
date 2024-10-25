extends Node2D

@export var rock_hit_particle: Resource

var particle_names = [
	"rock_hit_particle"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_particle(name: String):
	var particle
	if particle_names.has(name):
		if (name == "rock_hit_particle"):
			particle = rock_hit_particle.instantiate()
			add_child(particle)
			_emit(particle)
			
func _emit(particle: GPUParticles2D):
	particle.emitting = true
	
