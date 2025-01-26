extends CanvasLayer
@onready var game_ui: CanvasLayer = $"../GameUI"

func _ready() -> void:
	self.hide()

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func Game_Over():
	game_ui.hide()
	get_tree().paused = true
	self.show()
