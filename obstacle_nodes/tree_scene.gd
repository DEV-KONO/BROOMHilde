class_name Tree_Scene extends Node2D
var EXPLOSION = preload("res://Props/Sprites/Explocion-Sheet.png")
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer

func _ready() -> void:
	$HitBox.Get_Gunthered.connect(get_gunthered)
	$HitBox.Deleted.connect(get_deleted)
	pass

func _process(delta: float) -> void:
	pass
 
func get_gunthered(_damage : int) -> void:
	animation_player.play("EXPLOTAR")
	
func get_deleted(_damage : int) -> void:
	queue_free()
	print("ARBOL ELIMINADO")
