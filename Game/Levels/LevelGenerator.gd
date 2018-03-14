# LevelGenerator.gd

extends Node

export (int) var dificulty = 0

var level setget , get_level

var is_win = false
var figure

func _ready():
	randomize()
	
	# Crea la figura con la disposición de los enemigos en pantalla
	create_figure()

func create_figure():
	# Se ocupa round ya que la aproximación de int() no es redondeada
	var rand_figure = int(round(rand_range(1, 3)))
	var rec_figure = load(str("res://Game/Levels/LevelFigures/Figure" + str(rand_figure) + ".tscn"))
	figure = rec_figure.instance()
	add_child(figure)

# Retorna el nivel para incluirlo desde Levels.tscn
func get_level(dificulty, stage_level, player_level):
	create_enemies(dificulty, stage_level, player_level)

func create_enemies(dificulty, stage_level, player_level):
	if figure == null:
		return
	
	for element_mesh in get_tree().get_nodes_in_group("ElementMesh"):
		if element_mesh.has_ship:
			figure.get_node("CoordinateMesh").enemy_amount += 1
			print(figure.get_node("CoordinateMesh").enemy_amount)
			
			# Por mientras agregar solo badships normales TEMP
			var enemy = load("res://Game/Actors/Enemies/BadShip/BadShip.tscn").instance()
			# TODO: Setiar las características random de los enemigos
			enemy.global_position = element_mesh.global_position
			add_child(enemy)
			
			enemy.connect("drop_item", self, "_on_drop_item", [enemy])
			
func _on_drop_item(enemy):
	# TODO: Por el momento dropea un toolbox, pero a futuro tiene que
	# dropear un item aleatorio.
	var item = load("res://Game/Items/Toolbox/ItemToolbox.tscn").instance()
	item.get_node("Body").global_position = enemy.global_position
	add_child(item)
	item.impulse()
	