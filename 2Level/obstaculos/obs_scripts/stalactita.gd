class_name Stalactita extends Node2D

func _ready() -> void:
	$HitBox.Deleted.connect(get_deleted)
	pass

func _process(delta: float) -> void:
	pass

func get_deleted(_damage : int) -> void:
	queue_free()
	print("STALACTITA ELIMINADO")
