# ItemManager.gd

extends Node

func _ready():
	randomize()

func generate_first_items(player_inv):
	var amount

	# Obtener la data para almacenar cosas en el inventario
	var data = Persistence.get_data(Main.get_current_account())
	print("Main.get_current_account(): ", Main.get_current_account())

	# Generar de 1 a 3 toolbox
	amount = int(round(rand_range(1, 3)))

	for i in range(amount): # amount
		var toolbox = load("res://Game/Items/Toolbox/ItemToolbox.gd").new()
		var max_size = int(round(rand_range(0, 1)))
		toolbox.create_random_toolbox(0, max_size)
		player_inv.add_item_in_inventory(toolbox)
#		print("Toolbox: ", toolbox)
#		print("toolbox.get_item_name(): ", toolbox.get_item_name())

	data["PlayerInventory"] = player_inv.get_serialized()

#	# Generar de 1 a 2 energy # TODO
#	amount = round(rand_range(1, 2))
#
#	# Generar de 5 a 25 coins
#	amount = round(rand_range(5, 25))
##	Persistence.get_account_data()["Coins"] = amount
#
#	# Test
##	Persistence.get_account_data()["Nuevo"] = "hola"

#	# Salvar la data
	Persistence.save_data(Main.get_current_account())
	
func generate_random_item(level):
	pass