extends State

func Enter():
	player.is_running = false
	player.velocity.z = 0
	playback.travel("Idle")


func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("Upward inp"):
		state_machine.change_state(state_machine.get_node("Jump"))
		
	if Input.is_action_just_pressed("Left inp") or Input.is_action_just_pressed("Right inp"):
		state_machine.change_state(state_machine.get_node("Walk"))
	
	if Input.is_action_just_pressed("Light"):
		state_machine.change_state(state_machine.get_node("Light grounded attack"))
		return
	
	if Input.is_action_just_pressed("Medium"):
		state_machine.change_state(state_machine.get_node("Medium grounded attack"))
		return

	if Input.is_action_just_pressed("Heavy"):
		state_machine.change_state(state_machine.get_node("Heavy grounded attack"))
		return
 
	
