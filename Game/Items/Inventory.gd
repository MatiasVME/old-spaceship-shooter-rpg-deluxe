# Inventory.gd

export (Array) var inventory = []

func add_item_in_inventory(item):
	inventory.append(item)

func remove_item_in_inventory(item_name):
	if inventory.size() < 0:
		print("El inventario esta vacio")
		return
	
	var i = 0
	while (i < inventory.size()):
		if inventory[i].item_name == item_name:
			inventory.remove(i)
		i += 1

