extends Sprite3D

var vec_dir

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotation = self.rotation + Vector3(0, 0, 0.05)
	vec_dir = $"../Cross3".position -  $"../../Camera3D".position 
	self.position = (vec_dir)*0.9 + $"../../Camera3D".position + Vector3(0, 0, -1)
	pass
