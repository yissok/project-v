extends Sprite3D

var pos_y = Input.get_axis("la_up", "la_down")
var pos_x = Input.get_axis("la_left", "la_right")
var velocità = 1.00

func _ready():
	pass

func _process(delta):
	self.rotation = self.rotation + Vector3(0, 0, 0.05)
	pos_y = Input.get_axis("la_up", "la_down")
	pos_x = Input.get_axis("la_left", "la_right")
	self.position += (Vector3(pos_x, -pos_y, 0)*velocità)
	pass
