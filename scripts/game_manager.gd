extends Node2D

@onready var label: Label = $Label

var IS_IDLE = true
var SCORE = 0
var PLAYER_IN

func _process(_delta: float) -> void:
	label.text = str(SCORE)

func _on_point_area_entered(_area: Area2D) -> void:
	PLAYER_IN = true

func _on_point_area_exited(_area: Area2D) -> void:
	PLAYER_IN = false
