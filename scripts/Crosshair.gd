extends Node3D

var offset_cam = Vector3(0, 0, -1)

func _ready():
	pass

func _process(delta):
	pass

func moveCrossHair(direction, node, offset):
	
	node.rotation = node.rotation + Vector3(0, 0, 0.05 * direction)
	
	offset_cam = Vector3(0,0, float($slider_offset_camera.value/-100))
	
	var vec_dir = ($"CrossMain".position -  ($"../Camera3D".position + offset_cam))*offset
	node.position = vec_dir + ($"../Camera3D".position + offset_cam)
