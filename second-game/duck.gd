extends Area2D

signal hit_target(name)

@export var sprite : Texture2D
@export var move_key: String = 'f'
@export var speed: int = 2000
@export var go_right: bool = true

var direction: int
var move_duck: bool = false
var label: String = "Press "

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite.texture = sprite
	if go_right:
		direction = 1
		$Sprite.flip_h = false
	else:
		direction = -1
		$Sprite.flip_h = true
	$Label.text  = label + move_key.to_upper()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if move_duck:
		var vel_x = speed * direction * delta
		#print(position.x, vel_x)
		position.x = position.x + vel_x
		move_duck = false

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_released():
		# this converts the numeric key code into its "letter" representation
		var key_pressed = OS.get_keycode_string(event.physical_keycode)
		# compare to the key we specified in the inspector
		if key_pressed == move_key.to_upper():
			move_duck = true
			#print("move true")

func _on_area_entered(area: Area2D) -> void:
	print(area.name)
	hit_target.emit(self.name)
