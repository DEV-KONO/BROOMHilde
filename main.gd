extends Node2D

@onready var main_menu: CanvasLayer = $MainMenu
@onready var Broomhilde: Player = $CharacterBody2D
@onready var game_ui: CanvasLayer = $GameUI
@onready var bubbles_music: AudioStreamPlayer = $Bubbles_Music
@onready var tutorial_timer: Timer = $tutorial_timer
@onready var tutorial: CanvasLayer = $Tutorial
@onready var cinematica: AnimationPlayer = $cinematica_sprite/Cinematica
@onready var cinematica_sprite: Sprite2D = $cinematica_sprite


var obstacle = preload("res://obstacle_nodes/tree.tscn")
var items = preload("res://Item/items.tscn")
var item_sprites = [preload("res://Item/Item_Sprites/Books.png"), preload("res://Item/Item_Sprites/CalacaChida.png"), preload("res://Item/Item_Sprites/CrystalBall.png"), preload("res://Item/Item_Sprites/Crystals.png")]
@onready var camara: Camera2D = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.score = 0
	if Global.first:
		get_tree().paused = true
		Broomhilde.hide()
		cinematica.play("Cinematica")
		Global.first = false
	else:
		Broomhilde.show()
		cinematica_sprite.hide()
		game_ui.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if bubbles_music.playing == false:
		bubbles_music.play()
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

func _on_iniciar_pressed() -> void:
	#get_tree().paused = false
	main_menu.hide()
	tutorial.show()
	#Broomhilde.show()
	#game_ui.show()
	tutorial_timer.start()
	


func _on_tutorial_timer_timeout() -> void:
	tutorial.hide()
	get_tree().paused = false
	Broomhilde.show()
	game_ui.show()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	cinematica_sprite.hide()
	main_menu.show()
	pass # Replace with function body.
