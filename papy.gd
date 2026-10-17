extends CharacterBody3D

@onready var run_timer: Timer = $"Run timer"
@onready var animation_player: AnimationPlayer = $Papyrus/AnimationPlayer
@onready var metarig: Node3D = $Papyrus/metarig

const SPEED = 500.0
const RUNNING_SPEED = 2000.0
const JUMP_VELOCITY = 3000.0

var is_running := false
var last_direction := ""
var idle := true

func _ready() -> void:
	idle = true
	animation_player.play("Idle")

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y -= 150.0 * delta
		
	if Input.is_action_just_pressed("Upward inp"):
		velocity.y += JUMP_VELOCITY * delta
	
	if idle == true:
		if animation_player.current_animation != "Idle":
			animation_player.play("Idle")
	
	if is_running:
		if animation_player.current_animation != "Run":
			animation_player.play("Run")
	else:
		if animation_player.current_animation != "Walk" and not idle:
			animation_player.play("Walk")
	# Add the gravity
		
	if not Input.is_action_pressed("Left inp") and not Input.is_action_pressed("Right inp"):
		idle = true
		velocity.z = 0
		
	if Input.is_action_just_pressed("Left inp"):
		if rotation_degrees.y != 180:
			rotation_degrees.y = 180
		if last_direction == "left" and not run_timer.is_stopped():
			is_running = true
		else:
			last_direction = "left"
			run_timer.start()
	
	if Input.is_action_just_pressed("Right inp"):
		if rotation_degrees.y != 0:
			rotation_degrees.y = 0
		if last_direction == "right" and not run_timer.is_stopped():
			is_running = true
		else:
			last_direction = "right"
			run_timer.start()
		
	var current_speed = RUNNING_SPEED if is_running else SPEED
	
	if Input.is_action_pressed("Left inp"):
		
		idle = false
		velocity.z = -current_speed * delta
	elif Input.is_action_pressed("Right inp"):
		idle = false
		velocity.z = current_speed * delta
	else:
		velocity.z = 0
		is_running = false

	move_and_slide()
