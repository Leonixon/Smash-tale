extends CharacterBody3D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback: AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= 150.0 * delta
	
	move_and_slide()
