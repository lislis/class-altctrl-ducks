extends Area2D

signal clicked

@onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#print(event)
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.pressed == true:
				#print("duck")
				$AudioStreamPlayer2D.play()
				$CollisionShape2D.disabled
				hide()
				clicked.emit()
				
func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
