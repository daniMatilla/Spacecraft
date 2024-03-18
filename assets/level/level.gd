extends Node2D

func _ready():
    $BgMusic.play()

func _physics_process(delta):
    _moveLayer($Terrain, 1, 8, delta)
    _moveLayer($Clouds_1, 1, 24, delta)
    _moveLayer($Clouds_2, 2, 34, delta)

func _moveLayer(node, speed, frames_per_seconds, delta):
    node.scroll_base_offset += Vector2(0, speed) * frames_per_seconds * delta