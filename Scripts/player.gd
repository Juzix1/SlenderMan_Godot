extends CharacterBody3D

@onready var head = $head
@onready var camera = $head/camera

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var mouse_sens = 0.3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * deg_to_rad(mouse_sens))
		camera.rotate_x(-event.relative.y * deg_to_rad(mouse_sens))
		camera.rotation.x = clamp(camera.rotation.x,deg_to_rad(-60),deg_to_rad(60))
		
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
