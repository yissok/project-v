extends Sprite3D

func _ready():
	pass

func _process(delta):
	get_parent().moveCrossHair(-1, self, 0.5)
	pass
