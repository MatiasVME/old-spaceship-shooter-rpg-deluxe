extends Node

export (int) var dificulty = 0

var is_win = false

func _ready():
	# Genera la figura de la disposición de los enemigos en pantalla
	generate_figure()
	
	
func generate_figure():
	# Se ocupa round ya que la aproximación de int() no es redondeada
	var rand_figure = int(round(rand_range(1, 3)))
	var rec_figure = load(str("res://Game/Levels/LevelFigures/Figure" + str(rand_figure) + ".tscn"))
	var figure = rec_figure.instance()
	add_child(figure)