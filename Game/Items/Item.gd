extends Node

var item_name setget set_item_name, get_item_name
var description setget set_description, get_description
var texture setget set_texture, get_texture
var min_level_drop = 1 setget set_min_level_drop, get_min_level_drop

func set_texture(_texture):
	texture = _texture
	
func get_texture():
	return texture
	
func set_min_level_drop(_min_level_drop):
	min_level_drop = _min_level_drop
	
func get_min_level_drop():
	return min_level_drop

func set_item_name(_item_name):
	item_name = _item_name
	
func get_item_name():
	return item_name
	
func set_description(_description):
	description = _description

func get_description():
	return description