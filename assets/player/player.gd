class_name Player extends CharacterBody2D

@export var shoot: PackedScene

@onready var sprite = $AnimatedSprite2D
@onready var motion = Vector2.ZERO
@onready var can_shoot: bool = true
@onready var screen_size = get_viewport_rect().size
const SPEED = 100

func _ready():
	sprite.play()

func _physics_process(delta):
	_motion_ctrl()
	_animation_ctrl()
	motion = move_and_collide(motion * delta)

func _input(event):
	if event.is_action_pressed("ui_accept") and can_shoot:
		_shoot_ctrl()

func _motion_ctrl():
	if GLOBAL.get_axis() == Vector2.ZERO:
		motion = Vector2.ZERO
	else:
		motion = GLOBAL.get_axis() * SPEED
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _animation_ctrl():
	var axis = GLOBAL.get_axis()
	sprite.animation = "vertical"

	if axis.x == 1:
		sprite.animation = "horizontal"
		sprite.flip_h = true
	elif axis.x == - 1:
		sprite.animation = "horizontal"
		sprite.flip_h = false

func _shoot_ctrl():
	var shoot_instance = shoot.instantiate()
	shoot_instance.global_position = $ShootSpawn.global_position
	get_tree().call_group("level", "add_child", shoot_instance)
