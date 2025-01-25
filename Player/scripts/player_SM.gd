class_name PlayerStateMachine extends Node

var states : Array[State]
var prev_State : State
var curr_State : State


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	changeState(curr_State.Process(delta))
	pass

func _physics_process(delta: float) -> void:
	changeState(curr_State.Physics(delta))
	pass

func _unhandled_input(event):
	changeState(curr_State.handle_Input(event))
	pass


func Initialize(_player : Player) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)
	
	if states.size() > 0:
		states[0].player = _player
		changeState(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT

func changeState(new_state : State) -> void:
	if new_state == null || new_state == curr_State:
		return
	
	if curr_State:
		curr_State.Exit()
	
	prev_State = curr_State
	curr_State = new_state
	curr_State.Enter()
