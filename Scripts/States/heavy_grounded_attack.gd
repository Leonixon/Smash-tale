extends State

@onready var bone: Node3D = $"../../Papyrus/metarig/Skeleton3D/PhysicalBoneSimulator3D/Physical Bone hand_L/Bone"

func Enter():
	bone.show()
	playback.travel("Heavy attack")

func physics_update(_delta: float) -> void:
	if playback.get_current_node() != "Heavy attack":
		return
	
	if playback.get_current_play_position() >= playback.get_current_length():
		if Input.is_action_pressed("Left inp") or Input.is_action_pressed("Right inp"):
			state_machine.change_state(state_machine.get_node("Walk"))
			return
		else:
			state_machine.change_state(state_machine.get_node("Idle"))

func Exit():
	bone.hide()
