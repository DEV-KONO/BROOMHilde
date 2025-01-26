extends CharacterBody2D

var pos : Vector2
var dir : float
var speed = 2000

func _ready():
	global_position=pos
	$HitBox.Deleted.connect(get_deleted)

func _physics_process(delta: float) -> void:
	velocity = Vector2(speed*delta,0)
	move_and_collide(velocity)

func get_deleted(_damaeg : int) -> void:
	queue_free()
	print("ESPINA ELIMINADO")
