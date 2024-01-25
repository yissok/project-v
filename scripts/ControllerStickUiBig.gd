extends Sprite2D

var pos_y = Input.get_axis("ra_up", "ra_down")
var pos_x = Input.get_axis("ra_left", "ra_right")
var sparato = false
var zona0 = false
var zona1 = false
var zona2 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pos_y = Input.get_axis("ra_up", "ra_down")
	pos_x = Input.get_axis("ra_left", "ra_right")
	$ControllerStickUiSmall.position = Vector2(pos_x, pos_y)*200
	_in_square(0.5, 0.5, 1, 1)
	if (Input.is_action_pressed("shoot")==true) && (sparato == false):
		_sparato()
	_ricarica()
	pass
	
func _in_square(x1:float, y1:float, x2:float, y2:float):
	if (Input.get_axis("ra_up", "ra_down") >= y1) && (Input.get_axis("ra_up", "ra_down") <= y2) && (Input.get_axis("ra_left", "ra_right")>= x1)  && (Input.get_axis("ra_left", "ra_right")<= x2):
		return true
		
func _sparato():
	sparato = true
	$gunshot.play()
	print("Sparato")
	pass
		
func _ricarica():
	if (sparato==true) && (_in_square(-0.2, -0.2, 0.2, 0.2) == true):
		zona0 = true
	if (zona0== true) && (_in_square(0.6, -0.2, 1, 0.2) == true):
		zona1 = true
		zona0 = false
		$reload1.play()
	if (zona1== true) && (_in_square(-0.2, 0.6, 0.2, 1) == true):
		zona2 = true
		zona1 = false
		$reload2.play()
	if (zona2== true) && (_in_square(-0.2, -0.2, 0.2, 0.2) == true):
		sparato = false
		zona2 = false
		$reload3.play()
		print("Ricaricato")
	pass
	
	
