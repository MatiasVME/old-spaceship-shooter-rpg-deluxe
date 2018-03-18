# LevelGenerator.gd

extends Node

export (int) var dificulty = 1 # 1 easy | 2 normal | 3 difícil

const LURE_DECREASE_FACTOR = 0.2

var level setget , get_level

var is_win = false
var figure

func _ready():
	randomize()
	
	# Crea la figura con la disposición de los enemigos en pantalla
	create_figure()
	
	# Esto es para poder ejecutar la escena individualmente,
	# requiere al menos un profile guardado en disco.
	Persistence.load_alternative_data()

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
#			print(figure.get_node("CoordinateMesh").enemy_amount)
			
			# Por mientras agregar solo badships normales TEMP
			var enemy = load("res://Game/Actors/Enemies/BadShip/BadShip.tscn").instance()
			create_enemy(enemy, dificulty, stage_level, player_level, element_mesh)
			add_child(enemy)
			
			enemy.connect("drop_item", self, "_on_drop_item", [enemy])
			
func create_enemy(enemy, dificulty, stage_level, player_level, element_mesh):
	# TODO: Setiar las características random de los enemigos
	var hp_increase_factor = dificulty * player_level * stage_level * 0.2
#	print("hp_increase_factor:", hp_increase_factor)
	enemy.min_life = round(rand_range(2 + hp_increase_factor, 4 + hp_increase_factor))
	enemy.max_life = round(rand_range(5 + hp_increase_factor, 8 + hp_increase_factor))
#	print(enemy, " min: ", enemy.min_life, " max: ", enemy.max_life)
	
	enemy.xp_value = round(enemy.max_life - (enemy.max_life / 2))
#	print("enemy.xp_value: ", enemy.xp_value)
	
	enemy.min_wait_time = round(rand_range(3, 6))
	enemy.max_wait_time = round(rand_range(6, 10))
	
	# TODO: Esto no esta testiado
	var item_luck = Persistence.get_account_data()["PlayerStats"].stats["ItemLuck"]
	enemy.one_of_each = round(20 - item_luck * LURE_DECREASE_FACTOR)
	
	enemy.global_position = element_mesh.global_position

func _on_drop_item(enemy):
	# TODO: Por el momento dropea un toolbox, pero a futuro tiene que
	# dropear un item aleatorio.
	# ItemManager.get_random_item(level)
	var item = load("res://Game/Items/Toolbox/ItemToolbox.tscn").instance()
	item.get_node("ItemInBattle").global_position = enemy.global_position
	add_child(item)
	item.get_node("ItemInBattle").impulse()
	