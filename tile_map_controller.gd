extends TileMap

const main_layer = 0
const main_atlas_id = 0

var children: Array[Node]

var is_unit_selected = false
var selected_unit

func _input(event):
	# When a tile is clicked, (de)select unit on that tile (if unit selected, move to that tile)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			var global_clicked = event.position
			var pos_clicked = local_to_map(to_local(global_clicked))
			print(pos_clicked)
			
			# Check if unit is being deselected
			if selected_unit != null:
				if local_to_map(to_local(selected_unit.get_global_position())) == pos_clicked:
					print("unit deselected!")
					selected_unit = null
				# If unit not deselected, check for movement
				else:
					# if not blocked, move_to pos
					var blocking_unit = get_unit_at_tile(pos_clicked)
					if blocking_unit == null:
						selected_unit.move_to(pos_clicked)
			
			# Check if any unit at pos_clicked
			# TODO: replace with a 2D area cast to obtain all overlapping tile, units, and hazards
			else: 
				selected_unit = get_unit_at_tile(pos_clicked)
				if selected_unit != null:
					print("unit selected!")
		
		# TODO: Toggle right-click menu/quick options?
		if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			selected_unit = null
			
func get_unit_at_tile(pos):
	children = get_children()
	for child in children:
		# If node is a Combantant and at pos, return
		if child.has_method('move_to') and local_to_map(to_local(child.get_global_position())) == pos:
			return child

			# Changes the tile color on tile Click
			#var current_atlas_coords = get_cell_atlas_coords(main_layer, pos_clicked)
			#var current_tile_alt = get_cell_alternative_tile(main_layer, pos_clicked)
			#var number_of_alts_for_clicked = tile_set.get_source(main_atlas_id)\
					#.get_alternative_tiles_count(current_atlas_coords)
			#set_cell(main_layer, pos_clicked, main_atlas_id, current_atlas_coords, 
							#(current_tile_alt + 1) % number_of_alts_for_clicked)
