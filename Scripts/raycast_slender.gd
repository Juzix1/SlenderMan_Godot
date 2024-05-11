extends RayCast3D

signal looking
signal not_looking

func _physics_process(delta):
	var collider = get_collider()
	if is_colliding() and collider.is_in_group("enemies"):
		emit_signal("looking")
	else:
		emit_signal("not_looking")
		
