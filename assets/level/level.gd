extends Node2D

@export var enemy: PackedScene

@onready var enemy_timer = $EnemyTimer
@onready var bg_music = $BgMusic
@onready var enemy_spawn = get_node("EnemyPath/EnemySpawn")

func _ready():
	bg_music.play()
	enemy_timer.start()
	randomize()

func _physics_process(delta):
	moveLayer($Terrain, 1, 8, delta)
	moveLayer($Clouds_1, 1, 24, delta)
	moveLayer($Clouds_2, 1, 34, delta)

func moveLayer(node, speed, frames_per_seconds, delta):
	node.scroll_base_offset += Vector2(0, speed) * frames_per_seconds * delta

func _on_hud_game_over():
	bg_music.stop()

func _on_enemy_timer_timeout():
	enemy_spawn.progress = randi()
	var enemy_instance = enemy.instantiate()
	add_child(enemy_instance)
	enemy_instance.position = enemy_spawn.position
	enemy_timer.wait_time = GLOBAL.random(1, 3)
	enemy_timer.start()
