class_name State extends Node

## Stores ref to the player
static var player: Player

func _ready() -> void:
	
	pass

func Enter():
	pass

func Exit():
	pass

func Process(_delta : float) -> State:
	return null

func Physics(_delta : float) -> State:
	return null

func handle_Input(_event: InputEvent) -> State:
	return null
