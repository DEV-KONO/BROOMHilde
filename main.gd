extends Node2D


var obstacle = preload("res://obstacle_nodes/tree.tscn")
var items = preload("res://Item/items.tscn")
var item_sprites = [preload("res://Item/Item_Sprites/Books.png"), preload("res://Item/Item_Sprites/CalacaChida.png"), preload("res://Item/Item_Sprites/CrystalBall.png"), preload("res://Item/Item_Sprites/Crystals.png")]
@onready var camara: Camera2D = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_obstacle_spawn_timer_timeout() -> void:
	var tree = obstacle.instantiate()
	var item = items.instantiate()
	#var item_sprite = item_sprites[randi() % item_sprites.size()]
	#item.get_node("Sprite2D").texture = item_sprite
	tree.position = camara.get_cam_pos() + Vector2(1200, 540)
	item.position = camara.get_cam_pos() + Vector2(1000, randf_range(-530,87))
	add_child(tree)
	add_child(item)


func _on_button_2_pressed() -> void:
	get_tree().quit()
