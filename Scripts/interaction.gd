extends RayCast3D
@onready var label = $"../../../InteractableUi/Label"
@onready var pick_timer = $"../../../InteractableUi/pick_timer"
@onready var label_anim = $"../../../InteractableUi/LabelAnim"
var current_collider

func _ready():
	label.hide()

func _physics_process(delta):
	%TextureRect.hide()
	var collider = get_collider()
	if is_colliding() and collider.is_in_group("Interactable"):
		%TextureRect.show()
		if Input.is_action_pressed("interact"):
			collider.interact()
			
			#label.text = "Pages "+game_manager.get_pages()+"/8"


func _on_pick_timer_timeout():
	label_anim.play("fade_out")


func hide_label():
	label.hide()


func _pages_count_update(arg1):
	label.show()
	label_anim.play("RESET")
	pick_timer.start()
	label.text = "Picked "+str(arg1)+"/8"
	
