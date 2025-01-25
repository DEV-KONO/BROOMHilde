class_name HitBox extends Area2D

signal Damaged(damage : int)

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func takeDamage(damage : int) -> void:
	print("Took damage", damage)
	Damaged.emit(damage)
