extends Node2D

var obstacle = preload("res://obstacle_nodes/tree.tscn")
@onready var camara: Camera2D = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_obstacle_spawn_timer_timeout() -> void:
	var tree = obstacle.instantiate()
	tree.position = camara.get_cam_pos() + Vector2(1200, 540)
	add_child(tree)
