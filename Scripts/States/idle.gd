extends State

func Enter():
	playback.travel("Idle")


func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("Upward inp"):
		state_machine.change_state(state_machine.get_node("Jump"))
		
	if Input.is_action_just_pressed("Left inp") or Input.is_action_just_pressed("Right inp"):
		state_machine.change_state(state_machine.get_node("Walk"))
		player.playback.travel("Walk")
	
