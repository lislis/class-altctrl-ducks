extends Node2D

@onready var won: bool = false


func _on_duck_hit_target(name: String) -> void:
	if not won:
		print(name, " won")
		var winner = get_node(name)
		winner.scale = Vector2(2.3, 2.3)
		winner.get_node("Label").text = "This duck is a winner"
		$Timer.start()
		won = true

func _on_timer_timeout() -> void:
	Global.exit_to_menu()
