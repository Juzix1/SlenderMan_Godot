extends RayCast3D

var current_collider

func _physics_process(delta):
	%InteractableUi.hide()
	var collider = get_collider()
	if is_colliding() and collider.is_in_group("Interactable"):
		%InteractableUi.show()
		if Input.is_action_pressed("interact"):
			collider.interact()
