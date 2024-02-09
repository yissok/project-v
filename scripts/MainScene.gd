extends Node3D

var level_scene = preload("res://scenes/level.tscn")
var player_scene = preload("res://scenes/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	level_scene.instantiate()
	player_scene.instantiate()	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
