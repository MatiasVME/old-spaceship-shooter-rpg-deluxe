# ItemConsumable.gd

extends "./Item.gd" 

signal item_consumed

var is_consumed = false setget set_is_consumed, get_is_consumed

func set_is_consumed(_is_consumed):
	is_consumed = _is_consumed

func get_is_consumed():
	return is_consumed