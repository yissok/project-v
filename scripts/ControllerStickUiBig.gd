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
	UP_LEFT,
	UP,
	UP_RIGHT,
	LEFT,
	CENTER,
	RIGHT,
	DOWN_LEFT,
	DOWN,
	DOWN_RIGHT
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

func get_joystick_position(x_input: int, y_input: int) -> JoystickPosition:
	if x_input < 0:
		if y_input < 0:
			return JoystickPosition.UP_LEFT
		elif y_input > 0:
			return JoystickPosition.DOWN_LEFT
		else:
			return JoystickPosition.LEFT
	elif x_input > 0:
		if y_input < 0:
			return JoystickPosition.UP_RIGHT
		elif y_input > 0:
			return JoystickPosition.DOWN_RIGHT
		else:
			return JoystickPosition.RIGHT
	else:
		if y_input < 0:
			return JoystickPosition.UP
		elif y_input > 0:
			return JoystickPosition.DOWN
		else:
			return JoystickPosition.CENTER

func _spara():
	$gunshot.play()
	sparato = true
	self.emit_signal("shot_fired")
	print("Sparato")
	pass

func _ricarica():
	if (sparato==true) && (joystick == JoystickPosition.CENTER):
		joy_state_idle = true
		sparato = false ## WILL REMOVE THESE DW, JUST TO EASE TESTING
		joy_went_down = false ## WILL REMOVE THESE DW, JUST TO EASE TESTING
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
	
	
