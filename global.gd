extends Node

var _axis: Vector2 = Vector2.ZERO

func get_axis() -> Vector2:
    _axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
    _axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
    return _axis.normalized()

