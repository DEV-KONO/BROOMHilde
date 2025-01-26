extends CanvasLayer
@onready var game_ui: CanvasLayer = $"../GameUI"
@onready var main_menu: CanvasLayer = $"../MainMenu"
@onready var cinematica_sprite: Sprite2D = $"../cinematica_sprite"

func _ready() -> void:
	self.hide()

func _on_button_pressed() -> void:
	get_tree().paused = false
	main_menu.hide()
	cinematica_sprite.hide()
	get_tree().reload_current_scene()

func Game_Over():
	game_ui.hide()
	get_tree().paused = true
	self.show()
