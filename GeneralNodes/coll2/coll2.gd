extends Node2D

@onready var camera_2d: Camera2D = $"../Camera2D"

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	position.x = camera_2d.position.x + 2000
