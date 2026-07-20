extends Node2D

@onready var won: bool = false

func _ready() -> void:
	# play a background track
	$AudioStreamPlayer2D.play()

func _on_duck_hit_target(name: String) -> void:
	if not won:
		print(name, " won")
		var winner = get_node(name)
		winner.scale = Vector2(2.3, 2.3)
		winner.get_node("Label").text = "This duck is a winner"
		$Timer.start()
		$GameOverSound.play()
		won = true

func _on_timer_timeout() -> void:
	Global.exit_to_menu()
