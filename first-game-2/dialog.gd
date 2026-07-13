extends Node2D

var game_scene = load("res://main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Dialogic.current_timeline != null:
		return

	Dialogic.start("intro")
	Dialogic.signal_event.connect(_on_dialogic_signal)
	 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_dialogic_signal(argument:String):
	print(argument)
	if argument == "start_game":
		get_tree().change_scene_to_packed(game_scene)
