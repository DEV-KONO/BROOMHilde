class_name Player extends CharacterBody2D

var cardinal_dir : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO

@onready var sprite : Sprite2D = $Sprite2D
@onready var state_machine: Node = $StateMachine


func _ready() -> void:
	state_machine.Initialize(self)
	pass

func _process(delta: float) -> void:
	direction = Vector2(Input.get_axis("move_Left","move_Right"), Input.get_axis("move_Up","move_Down")).normalized()
	pass

func _physics_process(delta):
	move_and_slide()

func set_Direction() -> bool:
	var new_dir : Vector2 = cardinal_dir
	if direction == Vector2.ZERO:
		return false
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	if new_dir == cardinal_dir:
		return false
	cardinal_dir = new_dir
	return true

func update_Animation(state : String) -> void:
	##animation_player.play(state + "_" + anim_Dir())
	pass

func anim_Dir() -> String:
	if cardinal_dir == Vector2.DOWN:
		return "Down"
	elif cardinal_dir == Vector2.UP:
		return "Up"
	else:
		return "Side"
