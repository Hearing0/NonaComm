extends Node2D

@onready var tile_map: TileMap = $"../../TileMap"
var tile_layer: int = 0

var astar_hex: AStarHexGrid2D
var current_id_path: Array = []

func _ready():
	# Shift combantant to center of tile
	#position = position.snapped(Vector2.ONE * tile_size)
	# TODO: Make tiles uniformly sized so this works!!!
	#position = Vector2.ONE * tile_size/2
	#global_position = tile_map.map_to_local(Vector2i.ZERO)
	
	astar_hex = AStarHexGrid2D.new()
	astar_hex.setup_hex_grid(tile_map, tile_layer)
	
func move_to(move_to_pos):
	var id_path = astar_hex.get_path(
		tile_map.local_to_map(global_position),
		move_to_pos
	)
	
	if id_path.is_empty() == false:
		print("first path", id_path[0])
		print("map path", tile_map.local_to_map((id_path[0])))
		current_id_path = Array(id_path)
	else: 
		print("ERROR: no path to move thru")
	
func _process(_delta):
	if current_id_path.is_empty():
		return
		
	#var target_position = tile_map.local_to_map(current_id_path.front())
	global_position = global_position.move_toward(current_id_path.front(), 2)
	
	#print(current_id_path[0])
	#print(target_position)
	#
	#if (Vector2i)((global_position/2).round()) == target_position:
	
	# Target position reached
	if position == current_id_path.front():
		current_id_path.pop_front()
