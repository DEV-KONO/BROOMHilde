extends Node2D
@export var player : NodePath


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(get_parent().get_child(2))
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	area.queue_free()
