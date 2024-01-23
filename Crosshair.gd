extends Node3D

func _ready():
	pass

func _process(delta):
	pass

func moveCrossHair(direction, node, offset):
	node.rotation = node.rotation + Vector3(0, 0, 0.05 * direction)
	var vec_dir = ($"CrossMain".position -  $"../Camera3D".position)*offset
	node.position = vec_dir + $"../Camera3D".position + Vector3(0, 0, 1)
