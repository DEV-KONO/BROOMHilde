class_name HitBox extends Area2D

signal Damaged(damage : int)
signal Get_Gunthered(damage : int)
func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func takeDamage(damage : int) -> void:
	var points : int = randi_range(20,150)
	Global.increaseScore(points)
	print("Took damage", damage)
	Damaged.emit(damage)

func get_gunthered(damage : int) -> void:
	Get_Gunthered.emit(damage)
