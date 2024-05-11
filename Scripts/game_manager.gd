extends Node

@onready var player = $"../Player"
const slender = preload("res://Scenes/slenderman_v_2.tscn")

var procent = RandomNumberGenerator.new()
var pages = 0

signal pages_info

func add_page():
	pages += 1
	
	if pages >= 2:
		if randomize_chance(pages) > 0.038:
			spawn_slender()
	if pages == 8:
		print("you win!")


func _update_pages():
	add_page()
	emit_signal("pages_info",pages)
	
func _physics_process(delta):
	get_tree().call_group("enemies", "update_target_location", player.global_transform.origin)
	
func randomize_chance(floatint):
	var chance = procent.randf_range(0.00,0.12*floatint)
	return chance
func spawn_slender():
	var object = slender.instantiate()
	object.position = player.global_position + Vector3(0,0,10)
	add_child(object)
	
