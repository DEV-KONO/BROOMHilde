extends Node2D


@export var obstacle_scene: PackedScene

func _on_Timer_timeout():
	
	var obstacle = obstacle_scene.instantiate()
	
	
	var x_position = self.global_position.x + 400  # Se supone que esto lo pone frente al personaje
	var y_position = 200  # lugar aleatorio
	
	obstacle.position = Vector2(x_position, y_position)
	
	
	$Obstacles.add_child(obstacle) # lo pone en el juego
