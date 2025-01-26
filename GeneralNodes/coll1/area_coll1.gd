class_name coll1 extends Area2D

@export var damage : int = 1
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	area_entered.connect(AreaEntered)
	pass 

func _process(delta: float) -> void:
	pass

func AreaEntered(a : Area2D) -> void:
	if a is HitBox:
		a.get_deleted(damage)
	pass
