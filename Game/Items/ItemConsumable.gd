# ItemConsumable.gd

extends "Item.gd" 

#signal item_consumed

var drop_probability = 5 setget set_drop_probability, get_drop_probability
var is_consumed = false setget , get_is_consumed

# Setters/Getters
#

func set_drop_probability(_drop_probability):
	drop_probability = _drop_probability
	
func get_drop_probability():
	return drop_probability

func get_is_consumed():
	return is_consumed