extends Node

var pages = 0

signal pages_info

func add_page():
	pages += 1
	print(pages)
	if pages == 2:
		print("you win!")


func _update_pages():
	add_page()
	emit_signal("pages_info",pages)
