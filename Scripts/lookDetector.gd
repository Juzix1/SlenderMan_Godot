extends Area3D

signal looking
signal notLooking


func _on_raycast_slender_looking():
	emit_signal("looking")


func _on_raycast_slender_not_looking():
	emit_signal("notLooking")
