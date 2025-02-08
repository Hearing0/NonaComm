extends Node

class_name CharacterStats

signal health_changed(new_health)
signal health_depleted()

var modifiers = {}

var health : int
var mana : int
var max_health: int
var max_mana : int
var strength : int
var defense : int
var speed : int 

func initialize(stats : StartingStats):
	max_health = stats.max_health
	max_mana = stats.max_mana
	strength = stats.strength
	defense = stats.defense
	speed = stats.speed
	health = max_health
	mana = max_mana

func set_max_health(x):
	max_health = max(0, x)

func set_max_mana(x):
	max_mana = max(0, x)

func take_damage(hit):
	health -= hit.damage
	health = max(0, health)
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("health_depleted")

func heal(x):
	health += x
	health = max(health, max_health)
	emit_signal("health_changed")

func add_modifier(id, modifier):
	modifiers[id] = modifier

func remove_modifier(id):
	modifiers.erase(id)
