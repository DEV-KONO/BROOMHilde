extends CharacterBody2D


var speed = 100

func _physics_process(delta):
	
	velocity.x = speed
	
	move_and_slide()

func _on_body_entered(body):
	if body.name == "Obstacle":
		get_tree().reload_current_scene()
		

	
	if is_on_wall():
		get_tree().reload_current_scene()
