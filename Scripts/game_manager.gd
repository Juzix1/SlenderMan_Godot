extends Node

@onready var player = $"../Player"
const slender = preload("res://Scenes/slenderman_v_2.tscn")
@onready var timer = $Timer
var procent = RandomNumberGenerator.new()
var pages = 0
var isSpawned = false

signal pages_info

func add_page():
	pages += 1
	if pages >= 2:
		if randomize_chance(pages) > 0.038:
			spawn_slender()
			if timer.is_stopped():
				timer.start()
				timer.autostart = true
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
	if !isSpawned:
		var object = slender.instantiate()
		#global_position
		object.position = player.slender_spawn()

		add_child(object)
		isSpawned = true
		object.connect("despawn", despawn)


func _on_timer_timeout():
		var chance = randf()
		if chance >= 0.5:
			spawn_slender()
			print("spawned slender")
		else:
			print("slender didn't spawned")
			#do here slender jumpsacre for 1 milisecond


func despawn():
	isSpawned = false
