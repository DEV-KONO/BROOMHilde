extends Node2D

@onready var area: Area2D = $Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = get_parent().get_child(2).position + Vector2.RIGHT*300#con este obtengo la referencia del jugador
	
	#print(area.get_overlapping_areas()) #esta es la referencia vdd?
	#obtenemos el padre de hitbox, si es item, el padre de hitbox es item y borramos esa referencia de la queue
	var area_ref = area.get_overlapping_bodies()
	print(area_ref)
	pass

#func # es que se ocupa un listener, se tiene que estar escuchando a ver quien entra en el area de los pinos, y cuando algo entre, se elimina
func area_entered(a):
	a.queue_free()
