extends State

const JUMP_STRENGHT := 50.0

func Enter():
	playback.travel("Mid air jump")
	player.velocity.y += JUMP_STRENGHT

func physics_update(_delta: float) -> void:
	if player.is_on_floor():
		if Input.is_action_pressed("Left inp") or Input.is_action_pressed("Right inp"):
			if player.is_running:
				state_machine.change_state(state_machine.get_node("Run"))
				return
			else:
				state_machine.change_state(state_machine.get_node("Walk"))
				return
		else:
			if player.velocity.z != 0:
				player.velocity.z = 0
			state_machine.change_state(state_machine.get_node("Idle"))
			return
				
