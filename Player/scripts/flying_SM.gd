class_name Flying extends State

@export var move_speed : float = 1000.0
@onready var idle: Node = $"../idle"

func Enter():
	player.update_Animation_fly("fly")
	pass

func Exit():
	pass

func Process(_delta : float) -> State:
	if (player.direction.x == 0 && player.direction.y != 0) || player.direction == Vector2.ZERO:
		return idle
	if player.direction.x < 0:
		player.velocity = (player.direction * move_speed) + (Vector2.RIGHT * 1250)
		#player.velocity = player.direction * (-move_speed)/3
	else:
		player.velocity = player.direction * move_speed
	if player.set_Direction():
		player.update_Animation_fly("fly")
	return null

func Physics(_delta : float) -> State:
	return null

func handle_Input(_event: InputEvent) -> State:
	#if _event.is_action("attack"):
	#	pass
	return null
