class_name Item extends Node2D

func _ready() -> void:
	$HitBox.Damaged.connect(takeDamage)
	pass

func _process(delta: float) -> void:
	position += Vector2.LEFT * delta
	pass
 
func takeDamage(_damage : int) -> void:
	#queue_free()
	
	pass
