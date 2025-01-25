class_name Idle extends State

@export var move_speed : float = 1000.0

@onready var flying: Flying = $"../flying"

func Enter():
	player.update_Animation_idle("idle")
	pass

func Exit():
	pass

func Process(_delta : float) -> State:
	if (player.direction.x != 0):
		return flying
	player.velocity = (player.direction + Vector2.RIGHT) * 500
	#player.velocity = Vector2.RIGHT * 500
	if player.set_Direction():
		player.update_Animation_idle("idle")
	print(move_speed)
	return null

func Physics(_delta : float) -> State:
	return null

func handle_Input(_event: InputEvent) -> State:
	#if _event.is_action("attack"):
	#	return attack
	return null
