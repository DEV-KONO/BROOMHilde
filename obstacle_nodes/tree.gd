extends Node2D
@onready var character_body_2d: Player = $"../CharacterBody2D"

var age = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2.LEFT * delta	
