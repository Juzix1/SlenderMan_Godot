extends CharacterBody3D

@onready var head = $head
@onready var camera = $head/camera
@onready var slenderspawn = $head/camera/slender_spawn
@onready var noise_screen = $InteractableUi/TextureRect2

const SPEED = 3.0
const JUMP_VELOCITY = 4.5
var mouse_sens = 0.3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var Looking = false
var death_meter = 0.0
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * deg_to_rad(mouse_sens))
		camera.rotate_x(-event.relative.y * deg_to_rad(mouse_sens))
		camera.rotation.x = clamp(camera.rotation.x,deg_to_rad(-60),deg_to_rad(60))
		
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta


	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
	noise_screen.modulate = Color(1,1,1,death_meter)
	if Looking:
		death_meter += delta
	else:
		if death_meter >=0:
			death_meter -= delta * 0.5
			
	
	#update noise screen brightness


func look_meter_start():
	print("looking player")
	Looking = true
func look_meter_stop():
	print("not looking player")
	Looking = false
	
func slender_spawn():
	var position = Vector3(slenderspawn.global_position.x,global_position.y,slenderspawn.global_position.z)
	return position
