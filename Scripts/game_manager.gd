extends Node

var pages = 0

func add_page():
	pages += 1
	if pages == 2:
		print("you win!")
func get_pages():
	return pages
