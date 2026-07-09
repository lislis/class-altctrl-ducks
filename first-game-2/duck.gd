extends Area2D

var bananas = 10
func do_something_with_bananas(num_of_bananas) -> void:
	for n in range(num_of_bananas):
		print(n)
		if n % 2 == 0:
			print("even bananas, beautiful")
		else:
			print("odd banana, dont eat")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	do_something_with_bananas(bananas)
	#pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.
