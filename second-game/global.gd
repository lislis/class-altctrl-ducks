extends Node

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		exit_to_menu()

func exit_to_menu() -> void:
	var menu_scene = load("res://Menu.tscn")
	get_tree().change_scene_to_packed(menu_scene)
