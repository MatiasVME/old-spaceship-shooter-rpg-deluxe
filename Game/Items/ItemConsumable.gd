# ItemConsumable.gd

extends "./Item.gd"

var drop_probability = 5 setget set_drop_probability, get_drop_probability
var is_consumed = false setget , get_is_consumed

# Setters/Getters
#

func get_serialized():
	var result = .get_serialized()
	
	result["DropProbability"] = drop_probability
	result["IsConsumed"] = is_consumed 
	
	return result

func set_drop_probability(_drop_probability):
	drop_probability = _drop_probability

func get_drop_probability():
	return drop_probability

func get_is_consumed():
	return is_consumed