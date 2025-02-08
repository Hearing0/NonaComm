extends Node2D

class_name TurnQueue

var active_character

func initialize():
	active_character = get_child(0)

func play_turn():
	await active_character.play_turn().completed
	var new_idx : int = (active_character.get_index() + 1) % get_child_count()
	active_character = get_child(new_idx)

static func compare_combatant_speed(a : Combatant, b : Combatant) -> bool:
	return  > 
