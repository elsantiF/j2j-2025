extends RigidBody2D

@export var characterTexture: Texture2D

func _ready() -> void:
	if characterTexture:
		$Sprite.texture = characterTexture
