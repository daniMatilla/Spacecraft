extends CanvasLayer

signal game_over

func _ready():
    GLOBAL.score = 0

func _physics_process(_delta):
    $ScoreContainer/HBoxContainer/Score.text = str(GLOBAL.score)

func end_game():
    emit_signal("game_over")
    $GameOverContainer.visible = true
    $BgMusic.play()

func _on_menu_pressed():
    get_tree().reload_current_scene()

func _on_restart_pressed():
    get_tree().change_scene_to_file("res://assets/menu/menu.tscn")

func _on_player_tree_exiting():
    end_game()
