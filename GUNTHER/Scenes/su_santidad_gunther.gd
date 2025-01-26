extends Node2D
@export var player : NodePath
var y_dir = 1
var speed = 600

@onready var disparo: Timer = $Disparo

var bullet_path = preload("res://Espina.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		var player_node = get_node(player)
		position.x = player_node.global_position.x - 850
		position.y += speed*delta*y_dir
	
		if self.position.y < 50:
			y_dir *= -1
		elif self.position.y > 1000:
			y_dir *= -1
	
	if disparo.is_stopped():
		fire()
		disparo.start()
	


func fire():
	var bullet = bullet_path.instantiate()
	bullet.pos.x = position.x + 200
	bullet.pos.y = position.y
	get_tree().get_root().get_node(".").add_child(bullet)
