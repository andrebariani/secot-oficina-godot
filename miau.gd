extends Node2D

const corona = preload("res://CORONGA.tscn")
const corona2 = preload("res://CORONGA2.tscn")

var points = 0

func _on_Timer_timeout():
	var new_corona
	if randi() % 10 == 1:
		new_corona = corona2.instance()
	else:
		new_corona = corona.instance()
	self.add_child(new_corona)
	new_corona.connect("onCorongaKill", self, "on_Coronga_Kill")
	new_corona.global_position.x = randi() % 1000
	new_corona.global_position.y = randi() % 600
	
	if self.get_children().size() == 29:
		$Label3.visible = true
		$Timer.stop()
	else:
		$Timer.start($Timer.wait_time * 0.99)

func on_Coronga_Kill(new_points):
	points += new_points
	$Label2.set_text(str(points))
