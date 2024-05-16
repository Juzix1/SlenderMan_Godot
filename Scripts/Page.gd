extends "res://Scripts/Interactable.gd"

signal page_picked


func interact():
	print("zebrano notatke ")
	page_picked.emit()
	%GameManager._update_pages()
	queue_free()
