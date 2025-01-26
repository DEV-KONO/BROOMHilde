extends Node2D
@onready var creditos_animation: AnimationPlayer = $creditos_sprite/creditos_animation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	creditos_animation.play("creditos")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_creditos_animation_animation_finished(anim_name: StringName) -> void:
	get_tree().quit()
	pass # Replace with function body.
