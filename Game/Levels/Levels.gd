extends Node

func _ready():
	# dificulty | stage_level | player_level
	$LevelGenerator.get_level(0, 1, 1)
