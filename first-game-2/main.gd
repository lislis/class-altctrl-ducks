extends Node2D

@export var score: int
@export var score_label: String
# number of ducks to start with
@export var number_of_ducks: int 

# @export var test: Resource

var duck_scene = load("res://duck.tscn")
var display

var game_over_scene = load("res://gameover.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# overwrite with a random amount
	number_of_ducks = randi_range(4, 10)
	score = 0
	score_label = $Control/Clicks.text
	$Control/Clicks.text = score_label + "%s" % score
	
	display = DisplayServer.screen_get_size(get_window().current_screen)
	print(display)
	
	# create the set amount of ducks
	for n in range(0, number_of_ducks):
		_create_duck()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print($Countdown.time_left)
	pass
	
func _on_duck_clicked() -> void:
	score = score + 1
	print(score)
	$Control/Clicks.text = score_label + "%s" % score
	
func _create_duck() -> void:
	var new_duck = duck_scene.instantiate()
	var duck_size = new_duck.get_child(1).get_texture().get_size()
	var rand_x = randi_range(duck_size.x, display.x - duck_size.x)
	var rand_y = randi_range(duck_size.y, display.y - duck_size.x)
	new_duck.position = Vector2(rand_x, rand_y)
	$DuckManager.add_child(new_duck)
	new_duck.clicked.connect(_on_duck_clicked)

func _on_timer_timeout() -> void:
	_create_duck()

func _on_countdown_timeout() -> void:
	print("GAME OVER")
	get_tree().change_scene_to_packed(game_over_scene)
