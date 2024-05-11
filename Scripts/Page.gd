extends Interactable

signal page_picked

func interact():

	print("zebrano notatke ")
	emit_signal("page_picked")
	queue_free()
