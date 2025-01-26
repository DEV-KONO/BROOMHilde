extends Node2D

@onready var camera: Camera2D = $"../camLvl2"

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	position.x = camera.position.x + 2000
