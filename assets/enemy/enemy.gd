class_name Enemy extends Area2D

@export var explosion: PackedScene

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var speed

func _ready():
	sprite.play()
	speed = GLOBAL.random(32, 42)

func _physics_process(delta):
	position.y += speed * delta

func death_enemy():
	queue_free()
	explosion_ctrl()

func explosion_ctrl():
	var explosion_instance = explosion.instantiate()
	explosion_instance.global_position = $ExplosionSpawn.global_position
	get_tree().call_group("level", "add_child", explosion_instance)

func _on_screen_exited():
	queue_free()

func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		death_enemy()
		body.queue_free()

func _on_area_entered(area: Area2D):
	if area.is_in_group("shoot"):
		death_enemy()
		GLOBAL.score += 10
