extends Node

onready var item_container = $Vault/Margin/Scroll/VBox

var rec_item_panel = load("res://Game/Items/ItemPanel.tscn")

func _ready():
	Persistence.load_alternative_data()
	
	var inv = Persistence.get_account_data()["PlayerInventory"].get_inv()
	print("Inv: ", inv)
	
	# Añade los items al inventario que esta en esta escena. Es
	# el inventario en el cuál se encuentran todos los items.
	add_items_to_inventory(inv)
	print("Persistence.get_account_data().hash(): ", Persistence.get_account_data().hash())

func add_items_to_inventory(inv):
	for i in range(inv.size()):
		var item_panel = rec_item_panel.instance()
		item_panel.get_node("ItemImage").texture = inv[i].get_texture()
		item_panel.get_node("Title").text = inv[i].get_item_name()
		item_panel.get_node("Description").text = inv[i].get_description()
		
		item_container.add_child(item_panel)
	
func _on_Back_pressed():
	get_tree().change_scene("res://Game/Levels/LevelMode.tscn")
	