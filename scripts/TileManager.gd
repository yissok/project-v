extends Node3D

var time

# Called when the node enters the scene tree for the first time.
func _ready():
	time = 0.2 / $tile_sabbia.speed
	$timer_spawn_tile.wait_time = float(time)
	$timer_spawn_tile.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_timer_spawn_tile_timeout():
	$tile_sabbia.position = Vector3(0,0,0)
	pass # Replace with function body.
