extends Sprite3D

var pos_y = Input.get_axis("la_up", "la_down")
var pos_x = Input.get_axis("la_left", "la_right")
var velocità = 0.16

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotation = self.rotation + Vector3(0, 0, 0.05)
	pos_y = Input.get_axis("la_up", "la_down")
	pos_x = Input.get_axis("la_left", "la_right")
	self.position += (Vector3(pos_x, -pos_y, 0)*velocità)
	pass
