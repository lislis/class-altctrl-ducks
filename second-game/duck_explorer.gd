extends CharacterBody2D

@export var speed = 300.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if not $AudioStreamPlayer2D.playing:
		$AudioStreamPlayer2D.play()
	if velocity.x < 0:
		$DuckOutlineYellow.flip_h = true
	else:
		$DuckOutlineYellow.flip_h = false

func _physics_process(delta):
	get_input()
	move_and_slide()
