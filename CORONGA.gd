extends Area2D

export var hp = 1
export var points = 1

signal onCorongaKill(points)

func _on_CORONGA_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		hp -= 1
		if hp < 0:
			emit_signal("onCorongaKill", points)
			queue_free()
