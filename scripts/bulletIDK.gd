extends Node3D

var pos_y = Input.get_axis("la_up", "la_down")
var pos_x = Input.get_axis("la_left", "la_right")
var velocità = 0.96

var shot_journey=Vector3.ZERO
var ori_to_target=Vector3.ZERO

var target_at_shot_time=Vector3.ZERO

var last_shot_time=0
var timer=0

func _ready():
	self.visible = true
	self.position = $"..".get_ori()
	pass

func _process(delta):
	self.rotation = self.rotation + Vector3(0, 0, 0.08)
	timer = timer + delta
	self.position = target_at_shot_time * time_since_shot() + $"..".get_ori()
	if timer > 10:
		queue_free()
		print("despawn")
	pass



func time_since_shot() -> float:
	return timer-last_shot_time

