extends Node2D

@export var score: int
@export var score_label: String

var duck_scene = load("res://duck.tscn")
var display

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0
	score_label = $Control/Clicks.text
	$Control/Clicks.text = score_label + "%s" % score
	
	display = DisplayServer.screen_get_size()
	
	var new_duck = duck_scene.instantiate()
	var duck_size = new_duck.get_child(1).get_texture().get_size()
	var rand_x = randi_range(duck_size.x, display.x - duck_size.x)
	var rand_y = randi_range(duck_size.y, display.y - duck_size.x)
	new_duck.position = Vector2(rand_x, rand_y)
	
	$DuckManager.add_child(new_duck)
	
	for duck in $DuckManager.get_children():
		print(duck.name)
		duck.clicked.connect(_on_duck_clicked)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_duck_clicked() -> void:
	score = score + 1
	print(score)
	$Control/Clicks.text = score_label + "%s" % score
