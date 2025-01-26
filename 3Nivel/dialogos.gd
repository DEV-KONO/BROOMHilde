extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.process_mode = Node.PROCESS_MODE_DISABLED
	pass


func _on_x_pressed() -> void:
	pass # Replace with function body.
