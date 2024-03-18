class_name Explosion extends Node2D

func _ready():
    $AnimatedSprite2D.play()
    $AudioStreamPlayer.play()

func _on_audio_stream_player_finished():
    queue_free()
