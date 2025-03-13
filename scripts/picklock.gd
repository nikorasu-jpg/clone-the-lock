extends Area2D

@onready var game_manager: Node2D = $".."
@onready var timer: Timer = $"../../Timer"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

var ROTATION_SPEED = 1.75

func _process(delta: float) -> void:
	if not game_manager.IS_IDLE and not game_manager.PLAYER_IN and Input.is_action_just_pressed("space"):
		ROTATION_SPEED = 0
		animation_player.play("game_over")
		timer.start(.2)
	
	if game_manager.IS_IDLE and Input.is_action_just_pressed("space"):
		game_manager.IS_IDLE = false
	
	if not game_manager.IS_IDLE:
		rotate(ROTATION_SPEED * delta)
		
	if game_manager.PLAYER_IN and Input.is_action_just_pressed("space"):
		ROTATION_SPEED = ROTATION_SPEED * (-1)
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
