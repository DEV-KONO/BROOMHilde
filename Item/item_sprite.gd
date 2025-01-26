extends Sprite2D
var crystals = preload("res://Item/Item_Sprites/Crystals.png")
var crystal_ball = preload("res://Item/Item_Sprites/CrystalBall.png")
var calaca_chida = preload("res://Item/Item_Sprites/CalacaChida.png")
var books = preload("res://Item/Item_Sprites/Books.png")
var item_sprites = [books, calaca_chida, crystal_ball, crystals]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = item_sprites.pick_random()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
