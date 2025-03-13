extends Area2D

@onready var game_manager: Node2D = $".."
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var IS_CLOCKWISE = true
var ROTATION_AMMOUNT

func _ready() -> void:
	animation_player.play("point_pop_up")
	rotation_degrees = randf_range(20, 90)

# adds to score and rotate it based on previous direction
func add_score():
	animation_player.play("point_pop_up")
	ROTATION_AMMOUNT = deg_to_rad(randf_range(20, 90))
	game_manager.SCORE += 1
	
	if IS_CLOCKWISE:
		rotate(-ROTATION_AMMOUNT)
		IS_CLOCKWISE = false
	else:
		rotate(ROTATION_AMMOUNT)
		IS_CLOCKWISE = true
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("space") and game_manager.PLAYER_IN:
		add_score()
	
