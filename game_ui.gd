extends CanvasLayer
@onready var character_body_2d: Player = $"../CharacterBody2D"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_child(0).text = "Puntuación: " + str(Global.score)
	get_child(1).text = "Munición: " + str(character_body_2d.ammo)
	get_child(2).text = "Vidas: " + str(character_body_2d.health)
	if character_body_2d.ammo == 0:
		get_child(1).text = "RELOAD!!!"
	pass
