# ItemBullet.gd

extends "./Item.gd" 

var amount setget set_amount, get_amount
var in_game_texture setget set_in_game_texture, get_in_game_texture

func set_amount(_amount):
	amount = _amount

func get_amount():
	return _amount

func set_in_game_texture(_in_game_texture):
	in_game_texture = _in_game_texture

func get_in_game_texture():
	return in_game_texture
