class_name Item extends Node2D
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer

func _ready() -> void:
	$HitBox.Damaged.connect(takeDamage)
	$HitBox.Get_Gunthered.connect(get_gunthered)
	pass

func _process(delta: float) -> void:
	position += Vector2.LEFT * delta
	pass

func get_gunthered(_damage : int) -> void:
	animation_player.play("EXPLOSION")

func takeDamage(_damage : int) -> void:
	var points : int = randi_range(20,150)
	Global.increaseScore(points)
	queue_free()
	pass
