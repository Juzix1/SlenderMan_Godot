extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

var SPEED = 3.0
var inRange = false
var Looking = false
func _physics_process(delta):
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	if inRange and !Looking:
		velocity = velocity.move_toward(new_velocity, .25)
		move_and_slide()
		look_at(nav_agent.target_position, Vector3.UP)
	
func update_target_location(target_location):
	if inRange:
		if !Looking:
			nav_agent.target_position = target_location
		

func _on_navigation_agent_3d_target_reached():
	print("you died")


func _on_area_3d_body_entered(body):
	inRange=true
	print("someone is following you")


func _on_area_3d_body_exited(body):
	inRange=false
	print("you escaped...")



func _on_visible_on_screen_notifier_3d_screen_exited():
	Looking = false


func _on_visible_on_screen_notifier_3d_screen_entered():
	Looking = true
