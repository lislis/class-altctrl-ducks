extends Area2D

@export var dialogic_timeline: DialogicTimeline

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.hide()
	#dialogic_timeline = load(dialogic_timeline)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if $Label.is_visible_in_tree():
			print(event)
			Dialogic.start(dialogic_timeline)

func _on_body_entered(body: Node2D) -> void:
	$Label.show()

func _on_body_exited(body: Node2D) -> void:
	$Label.hide()
