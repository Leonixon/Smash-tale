extends Node

@export var initial_state: State

var current_state: State
var player: CharacterBody3D

func _ready() -> void:
	call_deferred("initialize")

func initialize() -> void:
	player = get_parent()
	for child in get_children():
		child.player = player
		child.state_machine = self
		child.playback = player.playback
	
	change_state(initial_state)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func change_state(new_state: State) -> void:
	if current_state:
		current_state.Exit()
	
	current_state = new_state
	current_state.Enter()
