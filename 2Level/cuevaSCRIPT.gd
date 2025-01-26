extends Node2D


var estalagmita = preload("res://2Level/obstaculos/collision_4.tscn")
var estalactita = preload("res://2Level/obstaculos/collision_3.tscn")
@onready var camara: Camera2D = $camLvl2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_2_pressed() -> void:
	get_tree().quit()
	pass

func _on_timer_timeout() -> void:
	var estalactitas = estalactita.instantiate()
	var estalagmitas = estalagmita.instantiate()
	#var item_sprite = item_sprites[randi() % item_sprites.size()]
	estalactitas.position = camara.get_cam_pos() + Vector2(randi_range(900,1200), 4)
	estalagmitas.position = camara.get_cam_pos() + Vector2(randi_range(900,1200), 1086)
	add_child(estalactitas)
	add_child(estalagmitas)
	pass
