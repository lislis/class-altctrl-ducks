extends Node2D

@export var score: int
@export var score_label: String = "Ducks clicked: "

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0
	$Control/Clicks.text = score_label + "%s" % score
	for duck in $DuckManager.get_children():
		#print(duck.name)
		duck.clicked.connect(_on_duck_clicked)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_duck_clicked() -> void:
	score = score + 1
	print(score)
	$Control/Clicks.text = score_label + "%s" % score
