extends Node2D

@export var obstacle_scene: PackedScene

func _on_Timer_timeout():
	
	var obstacle = obstacle_scene.instantiate()
	
	
	var x_position = self.global_position.x + 400 
	var y_position = randf_range(100, 300) 
	obstacle.position = Vector2(x_position, y_position)
	
	# Añade el obstáculo al juego
	$Obstacles.add_child(obstacle)
