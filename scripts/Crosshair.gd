extends Node3D

var offset_cam = Vector3(0, 0, -1)

func _ready():
	pass

func _process(delta):
	pass

func moveCrossHair(direction, node, offset):
	
	node.rotation = node.rotation + Vector3(0, 0, 0.05 * direction)
	
	offset_cam = Vector3(0,0, float($slider_offset_camera.value/-100))
	
	var ori_to_target = (get_target() -  (get_ori() + offset_cam))*offset
	node.position = ori_to_target + (get_ori() + offset_cam)


func get_ori() -> Vector3:
	return Vector3(0, 3, 1)

func get_target() -> Vector3:
	return $"CrossMain".position


func get_cam() -> Vector3:
	return $"../Camera3D".position
	
