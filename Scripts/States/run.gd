extends State

const SPEED := 30.0

func Enter():
	playback.travel("Run")

func physics_update(delta: float) -> void:
	if Input.is_action_just_pressed("Upward inp"):
		state_machine.change_state(state_machine.get_node("Jump"))
		return
		
	if Input.is_action_just_released("Left inp") or Input.is_action_just_released("Right inp"):
		player.velocity.z = 0
		state_machine.change_state(state_machine.get_node("Idle"))
		return
	
	if Input.is_action_pressed("Left inp"):
		player.velocity.z = -SPEED
	elif Input.is_action_pressed("Right inp"):
		player.velocity.z = SPEED
