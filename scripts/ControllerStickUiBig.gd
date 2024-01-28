extends Sprite2D

var pos_y
var pos_x
var joystick
var sparato = false
var joy_state_idle = false
var joy_went_right = false
var joy_went_down = false

signal shot_fired

enum JoystickPosition {
	CENTER,
	RIGHT,
	DOWN,
	OTHER
}

func _ready():
	pass

func _process(_delta):
	pos_x = Input.get_axis("ra_left", "ra_right")
	pos_y = Input.get_axis("ra_up", "ra_down")
	joystick=get_joystick_position(pos_x, pos_y)
	$ControllerStickUiSmall.position = Vector2(pos_x, pos_y)*200
	if (Input.is_action_pressed("shoot")==true) && (sparato == false):
		_spara()
	_ricarica()
	pass


func get_joystick_position(x_input: float, y_input: float) -> JoystickPosition:
	if is_inside_square(x_input, y_input, -0.2, -0.2, 0.2, 0.2):
		return JoystickPosition.CENTER
	elif is_inside_square(x_input, y_input, -0.2, 0.6, 0.2, 1):
		return JoystickPosition.DOWN
	elif is_inside_square(x_input, y_input, 0.6, -0.2, 1, 0.2):
		return JoystickPosition.RIGHT
	else:
		return JoystickPosition.OTHER

func is_inside_square(x: float, y: float, x1: float, y1: float, x2: float, y2: float) -> bool:
	return x >= x1 and x <= x2 and y >= y1 and y <= y2

func _spara():
	$gunshot.play()
	sparato = true
	self.emit_signal("shot_fired")
	pass

func _ricarica():
	if (sparato==true) && (joystick == JoystickPosition.CENTER):
		joy_state_idle = true
		#sparato = false ## WILL REMOVE THESE DW, JUST TO EASE TESTING
		#joy_went_down = false ## WILL REMOVE THESE DW, JUST TO EASE TESTING
	if (joy_state_idle== true) && (joystick == JoystickPosition.RIGHT):
		joy_went_right = true
		joy_state_idle = false
		$reload1.play()
	if (joy_went_right== true) && (joystick == JoystickPosition.DOWN):
		joy_went_down = true
		joy_went_right = false
		$reload2.play()
	if (joy_went_down== true) && (joystick == JoystickPosition.CENTER):
		sparato = false
		joy_went_down = false
		$reload3.play()
		print("Ricaricato")
	pass
	
	
