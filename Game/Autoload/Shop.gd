extends Node

func _ready():
	randomize()

func get_random_spaceship_skin():
	var rand_num = int(round(rand_range(1, 12)))
	return get_spacehip_skin(rand_num)

# Puede retornar el path de un skin del 1 al 12
func get_spacehip_skin(num):
	return str("res://Game/Actors/Player/Players/Player", num, ".png")