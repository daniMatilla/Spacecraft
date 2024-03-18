class_name Shoot extends Area2D

@onready var player: Player = get_tree().get_first_node_in_group("player")
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var sound_shoot: AudioStreamPlayer = $SoundShoot
const SPEED = 180

func _ready():
	player.can_shoot = false
	sprite.play()
	sound_shoot.play()

func _physics_process(delta):
	position.y -= SPEED * delta

func _on_area_entered(area: Area2D):
	if area.is_in_group("enemy"):
		queue_free()

func _on_screen_exited():
	player.can_shoot = true
	queue_free()
