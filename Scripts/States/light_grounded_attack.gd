extends State

func Enter():
	playback.travel("Light attack")

func physics_update(_delta: float) -> void:
	if playback.get_current_node() != "Light attack":
		return
	
	if playback.get_current_play_position() >= playback.get_current_length():
		if Input.is_action_pressed("Left inp") or Input.is_action_pressed("Right inp"):
			state_machine.change_state(state_machine.get_node("Walk"))
			return
		else:
			state_machine.change_state(state_machine.get_node("Idle"))
		return
