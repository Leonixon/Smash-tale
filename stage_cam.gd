extends Camera3D

@onready var papy: CharacterBody3D = $"../Papy"

func _process(delta: float) -> void:
	global_position.z = papy.global_position.z + 10
