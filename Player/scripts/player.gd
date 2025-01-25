class_name Player extends CharacterBody2D

var cardinal_dir_x : Vector2 = Vector2.RIGHT
var cardinal_dir_y : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
@export var max_health : int = 3
@export var immunity : bool = false

@onready var health : int = max_health

@onready var timer: Timer = $Timer
@onready var anim_player_shield: AnimationPlayer = $Sprite2D/Sprite2D/AnimPlayer_Shield
@onready var inmunity_timer: Timer = $InmunityTimer
@onready var sprite : Sprite2D = $Sprite2D
@onready var state_machine: Node = $StateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	state_machine.Initialize(self)
	$HitBox.Damaged.connect(takeDamage)
	timer.timeout.connect(_on_timer_timeout)
	pass

func _process(delta: float) -> void:
	direction = Vector2(Input.get_axis("move_Left","move_Right"), Input.get_axis("move_Up","move_Down")).normalized()
	
	if position.y < 72:
		position.y = 72
	elif position.y > 1020:
		position.y = 1020
	pass

func _physics_process(delta):
	move_and_slide()

func set_Direction() -> bool:
	var new_dir_x : Vector2 = cardinal_dir_x
	var new_dir_y : Vector2 = cardinal_dir_y
	if direction.y == 0 && direction.x !=0:
		new_dir_x = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
		new_dir_y = Vector2.ZERO
	elif direction.x == 0 && direction.y !=0:
		new_dir_y = Vector2.UP if direction.y < 0 else Vector2.DOWN
		new_dir_x = Vector2.ZERO
	elif direction.x == 0 && direction.y == 0:
		new_dir_y = Vector2.ZERO
		new_dir_x = Vector2.ZERO
	elif direction.x != 0 && direction.y !=0:
		new_dir_y = Vector2.UP if direction.y < 0 else Vector2.DOWN
		new_dir_x = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	
	if new_dir_x == cardinal_dir_x && new_dir_y == cardinal_dir_y:
		return false
	cardinal_dir_x = new_dir_x
	cardinal_dir_y = new_dir_y
	return true

func update_Animation_fly(state : String) -> void:
	animation_player.play(state + anim_Dir())
	pass

func update_Animation_idle(state : String) -> void:
	animation_player.play(state + anim_Dir_i())
	pass

func anim_Dir() -> String:
	if cardinal_dir_x == Vector2.RIGHT && cardinal_dir_y == Vector2.UP:
		return "_Right_Up"
	elif cardinal_dir_x == Vector2.RIGHT && cardinal_dir_y == Vector2.DOWN:
		return "_Right_Down"
	elif cardinal_dir_x == Vector2.LEFT && cardinal_dir_y == Vector2.DOWN:
		return "_Left_Down"
	elif cardinal_dir_x == Vector2.LEFT && cardinal_dir_y == Vector2.UP:
		return "_Left_Up"
	elif cardinal_dir_x == Vector2.LEFT && cardinal_dir_y == Vector2.ZERO:
		return "_Left_Mid"
	else:
		return "_Right_Mid"

func anim_Dir_i() -> String:
	if cardinal_dir_y == Vector2.DOWN && cardinal_dir_x == Vector2.ZERO:
		return "_Down"
	elif cardinal_dir_y == Vector2.UP && cardinal_dir_x == Vector2.ZERO:
		return "_Up"
	else:
		return "_Mid"

func takeDamage(_damage : int) -> void:
	if inmunity_timer.is_stopped() && immunity != true:
		inmunity_timer.start()
		health -= _damage
		timer.start()
		#anim_player_shield.play("shield")
		print("Health", health)
		immunity = true
	if health <= 0:
		die()
		print("dead")
	if inmunity_timer.time_left <= 0:
		immunity = false
	pass
func die() -> void:
		pass


func _on_timer_timeout():
	anim_player_shield.play("RESET")
	timer.start()
	pass
