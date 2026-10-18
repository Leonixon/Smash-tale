extends CharacterBody3D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback: AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")
@onready var run_timer: Timer = $"Run timer"
@onready var state_machine: Node = $"State Machine"

var is_running := false

var last_input := ""

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= 150.0 * delta
		
	_detect_double_tap()
	
	move_and_slide()



func _detect_double_tap():
	if not is_on_floor():
		return
		
	if Input.is_action_just_pressed("Left inp"):
		if last_input == "left" and not run_timer.is_stopped():
			run_timer.stop()
			is_running = true
			state_machine.change_state(state_machine.get_node("Run"))
		else:
			if rotation_degrees.y != 180:
				rotation_degrees.y = 180
			run_timer.start()
			last_input = "left"
			state_machine.change_state(state_machine.get_node("Walk"))

	if Input.is_action_just_pressed("Right inp"):
		if last_input == "right" and not run_timer.is_stopped():
			run_timer.stop()
			is_running = true
			state_machine.change_state(state_machine.get_node("Run"))
		else:
			if rotation_degrees.y != 0:
				rotation_degrees.y = 0
			run_timer.start()
			last_input = "right"
			state_machine.change_state(state_machine.get_node("Walk"))
