extends RigidBody2D

@export var SPEED: float = 0.75
@export var ENABLE_MOVEMENT: bool = true

@onready var Sprite: Sprite2D = $Viejo
var last_direction: int = -2

func do_movement() -> void:
	var direction: int = 0
	
	if Input.is_key_pressed(KEY_A):
		direction = -1
		last_direction = direction
	elif Input.is_key_pressed(KEY_D):
		direction = 1
		last_direction = direction
		
	self.translate(Vector2(direction * SPEED, 0))

func do_flip_sprite() -> void:
	if(last_direction == -2):
		return
		
	Sprite.flip_h = true if last_direction < 0 else false

func _process(delta: float) -> void:
	if(ENABLE_MOVEMENT):
		do_movement()
		
	do_flip_sprite()
