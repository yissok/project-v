extends Node3D
var bullet_scene = preload("res://scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$"../ControllerStickUiBig".connect("shot_fired", self._on_shot_fired)
	
	self.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_shot_fired():
	self.visible = true
	var bullet = bullet_scene.instantiate()  # Change the path accordingly
	bullet.target_at_shot_time=get_target() - get_ori()
	bullet.last_shot_time=bullet.timer
	bullet.look_at_from_position(get_ori(), get_target())
	add_child(bullet)

	print("Shot Fired by Player!")


func get_ori() -> Vector3:
	return Vector3(0, 4, 4)

func get_target() -> Vector3:
	return $"../Crosshair/CrossMain".position
