class_name Item extends Node2D
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
@onready var character_body_2d: Player = $"../CharacterBody2D"

func _ready() -> void:
	$HitBox.Damaged.connect(takeDamage)
	$HitBox.Get_Gunthered.connect(get_gunthered)
	$HitBox.Deleted.connect(get_deleted)
	pass

func _process(delta: float) -> void:
	position += Vector2.LEFT * delta
	if global_position.distance_to(character_body_2d.global_position) > 2000:
		self.queue_free()
	pass

func get_gunthered(_damage : int) -> void:
	animation_player.play("EXPLOSION")

func takeDamage(_damage : int) -> void:
	var points : int = randi_range(20,150)
	Global.increaseScore(points)
	queue_free()
	pass

func get_deleted(_damaeg : int) -> void:
	queue_free()
	print("ITEM ELIMINADO")
