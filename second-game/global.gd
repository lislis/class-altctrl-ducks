extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		exit_to_menu()

func exit_to_menu() -> void:
	var menu_scene = load("res://Menu.tscn")
	get_tree().change_scene_to_packed(menu_scene)
