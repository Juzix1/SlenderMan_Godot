extends Control
@onready var menu = $Menu
@onready var options = $Options



func _on_play_pressed():
	get_tree().change_scene_to_file("res://Maps/test_map.tscn")


func _on_options_pressed():
	pass

func _on_quit_pressed():
	get_tree().quit()
