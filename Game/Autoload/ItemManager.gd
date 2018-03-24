# ItemManager.gd

extends Node

func _ready():
	randomize()

func generate_first_items():
#	var amount
#
#	# Obtener el inventario
#	var player_inventory = Persistence.get_account_data()["PlayerInventory"]
#
#	# Generar de 1 a 3 toolbox
#	amount = int(round(rand_range(1, 3)))
##	print("amount: ", amount)
#
#	for i in range(amount): # amount
##		print("i: ", i)
#		var toolbox = load("res://Game/Items/Toolbox/ItemToolbox.gd").new()
#		var max_size = int(round(rand_range(0, 1)))
#		toolbox.create_random_toolbox(0, max_size)
#		player_inventory.add_item_in_inventory(toolbox)
#		print("Toolbox: ", toolbox)
#		print("toolbox.get_item_name(): ", toolbox.get_item_name())
#
#
#	print("Se generaron: ", player_inventory.get_inv())
#	print("player_inventory.get_inv()[0]: ", player_inventory.get_inv()[0])
#	print("player_inventory.get_inv()[0].get_item_name(): ", player_inventory.get_inv()[0].get_item_name())
#
#	# Generar de 1 a 2 energy # TODO
#	amount = round(rand_range(1, 2))
#
#	# Generar de 5 a 25 coins
#	amount = round(rand_range(5, 25))
##	Persistence.get_account_data()["Coins"] = amount
#
#	# Test
##	Persistence.get_account_data()["Nuevo"] = "hola"
#
#	# Salvar la data
#	print("Persistence.get_account_data().hash(): ", Persistence.get_account_data().hash())
#	print("save_account_data: ", Persistence.save_account_data(Main.current_account))
#	print("Persistence.get_account_data().hash(): ", Persistence.get_account_data().hash())
#	print(Persistence.account_data["PlayerInventory"].get_inv()[0].get_item_name())
	pass
	
func generate_random_item(level):
	pass