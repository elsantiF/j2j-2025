extends CharacterBody2D

@export var SPEED: float = 75.0
@export var GRAVITY: float = 980.0
@export var ENABLE_MOVEMENT: bool = true

@onready var Sprite: Sprite2D = $Viejo
var last_direction: int = 1

func handle_movement() -> void:
	var direction: float = Input.get_axis("left", "right")

	if direction != 0:
		velocity.x = direction * SPEED
		last_direction = int(direction)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 0.5)

func update_sprite_direction() -> void:
	Sprite.flip_h = true if last_direction < 0 else false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta


	if ENABLE_MOVEMENT and is_on_floor():
		handle_movement()

	move_and_slide()
		
	update_sprite_direction()
