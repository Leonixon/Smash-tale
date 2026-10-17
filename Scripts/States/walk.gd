extends State

@onready var run_timer: Timer = $"../../Run timer"

var last_input := ""

func Enter():
	run_timer.start()

func physics_update(delta: float) -> void:
	pass
 
