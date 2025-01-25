class_name Flying extends State

@export var move_speed : float = 1000.0

func Enter():
	player.update_Animation("fly")
	pass

func Exit():
	pass

func Process(_delta : float) -> State:
	if player.direction == Vector2.ZERO:
		pass
	player.velocity = player.direction * move_speed
	if player.set_Direction():
		player.update_Animation("fl")
	return null

func Physics(_delta : float) -> State:
	return null

func handle_Input(_event: InputEvent) -> State:
	if _event.is_action("attack"):
		pass
	return null
