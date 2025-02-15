extends Area2D


# TODO: Tile size to Hex shape???
var tile_size = 94
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"down": Vector2.DOWN,
			"up": Vector2.UP}

func _ready():
	# Shift combantant to center of tile
	position = position.snapped(Vector2.ONE * tile_size)
	# TODO: Make tiles uniformly sized so this works!!!
	position = Vector2.ONE * tile_size/2
	
func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("Left MB clicked at: ", event.position)
				
			else:
				print("Left MB released") 
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				print("Right MB clicked at: ", event.position)
			else:
				print("Right MB released") 
	
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	#if dir == Vector2.LEFT
		#position += 
	position += inputs[dir] * tile_size
	
func move_to(pos):
	position = pos
