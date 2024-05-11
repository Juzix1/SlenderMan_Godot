extends CharacterBody3D
@onready var raycast = $RayCast
@onready var eyes = $Eyes
@onready var mesh = $godot_man


var target



enum  {
	IDLE,
	FOLLOWING,
	ANGRY
}

var state = IDLE

func _ready():
	pass
	
func _process(delta):
	
	if raycast.is_colliding():
		state = FOLLOWING
		
	
	match state:
		IDLE:
			pass
		FOLLOWING:
			look_at(target.global_transform.origin, Vector3.UP)
			var vec_to_player = target.position - position
			#vec_to_player = vec_to_player.normalized
			move_and_collide(vec_to_player * .3 * delta)
			#rotate_y(deg_to_rad(mesh.rotation.y * 2))
			
			rotate_y(deg_to_rad(mesh.rotation.y * 2))
		ANGRY:
			pass


func _on_sight_range_body_entered(body):
	if body.is_in_group("Player"):
		print("you have been seen")
		state = FOLLOWING
		target = body


func _on_sight_range_body_exited(body):
	if body.is_in_group("Player"):
		print("you escaped...")
		state = IDLE
