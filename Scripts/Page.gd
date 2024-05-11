extends Interactable

@onready var game_manager = %GameManager

func interact():
	game_manager.add_page()
	print("zebrano notatke ")
	queue_free()
