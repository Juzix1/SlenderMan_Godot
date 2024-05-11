extends Node

@onready var player = $"../Player"



var pages = 0

signal pages_info

func add_page():
	pages += 1
	print(pages)
	if pages == 8:
		print("you win!")


func _update_pages():
	add_page()
	emit_signal("pages_info",pages)
	
func _physics_process(delta):
	get_tree().call_group("enemies", "update_target_location", player.global_transform.origin)
