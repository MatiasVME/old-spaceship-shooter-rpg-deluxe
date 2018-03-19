# Persistence.gd

extends Node

const ACCOUNTS_NAME_PATH = "user://accounts.bin"

# Sólo es un password temporal
var temporal_password = "y~mu_L!6$qq9o119y1W("

var accounts = [] setget , get_accounts
var account_is_loaded = false
var current_account

var account_data
var account_data_is_loaded = false

func _ready():
	var accounts_file_data = File.new()
	
	if accounts_file_data.file_exists(ACCOUNTS_NAME_PATH):
		load_accounts()
	else:
		save_accounts()
		load_accounts()
		
#	Test
#	test()
	
func test():
	load_accounts()
	create_account("Hola")
	
#	load_account_data("Hola")
#	var my_account_data = get_account_data()
#	my_account_data["Stats"] = "mis stats"
#	save_account_data("Hola")
#	print("my_account_data: ", my_account_data)
	
	save_accounts()

func save_accounts():
	account_is_loaded = false
	
	var file = File.new()
	
	if not Main.debug:
		file.open_encrypted_with_pass(ACCOUNTS_NAME_PATH, 
				File.WRITE, temporal_password)
		file.store_var(accounts)
	else:
		file.open(ACCOUNTS_NAME_PATH, File.WRITE)
		file.store_var(to_json(accounts))
	
	file.close()

func load_accounts():
	if not account_is_loaded:
		account_is_loaded = true
	else:
		return
	
	var file = File.new()
	
	if not Main.debug:
		file.open_encrypted_with_pass(ACCOUNTS_NAME_PATH, 
				File.READ, temporal_password)
		accounts = file.get_var()
	else:
		file.open(ACCOUNTS_NAME_PATH, File.READ)
		accounts = parse_json(file.get_var())
	
	file.close()
	
	if Main.debug: print("accounts: ", accounts)
	
	if accounts.size() >= 1:
		for account in accounts:
			print(account)

func create_account(name):
	if create_new_data(name):
		accounts.append(name)
		return true
	
	return false

# Crea la nueva data y la guarda
func create_new_data(account_name):
	var file = File.new()
	var path = "user://" + account_name + ".bin"
	
	if file.file_exists(path):
		if Main.debug: print("El archivo ", path, " ya existe")
		return false
	
	var data_account = create_data_account(account_name)
	
	if account_name != "accounts":
		var err = file.open_encrypted_with_pass(path, 
			File.WRITE, temporal_password)
		file.store_var(data_account)
		file.close()
		
		return true
	else:
		if Main.debug: print("account_name no puede llamarse: ", account_name)
		return false

func create_data_account(owner):
	# Se almacena el objeto player_stats no las stats en si
	var player_stats = load("res://Game/Actors/Player/PlayerStats.gd").new()
	var player_inventory = load("res://Game/Items/Inventory.gd").new()
	var battle_bag_inventory = load("res://Game/Items/Inventory.gd").new()
	
	var data_account = {
		Owner = owner,
		DataVersion = 1,
		Coins = 0,
		PlayerStats = player_stats,
		PlayerInventory = player_inventory,
		BattleBagInventory = battle_bag_inventory
	}
	
	return data_account

func delete_account(name):
	if not accounts.has(name):
		if Main.debug: print("No se encuentra %s para ser borrado" % name)
		return false
	
	delete_account_data(name)
	
	accounts.remove(accounts.find(name))
	save_accounts()
	
	return true
	
func delete_account_data(name):
	var directory = Directory.new()
	var path = "user://" + name + ".bin"
	
	if not directory.file_exists(path):
		if Main.debug: print("No se puede eliminar ", name, " ya que no existe el path: ", path)
		return

	var err = directory.remove(path)
	
# Setters/Getters
#

func get_accounts():
	return accounts

# Este método es para obtener la data de una cuenta en específico
# para uso mas recurrente es mejor utilizar get_account_data().
# Pero si se desea saber la data de otras cuentas se puede utilizar
# este método.
func load_account_data(account_name):
	print("-- Load account data --")
	
	if not account_data_is_loaded: # TODO: Ver si esto funciona o no
		account_data_is_loaded = true
		print("-- Account is loaded --")
	else:
		print("-- Account is not loaded --")
		return false
	
	var file = File.new()
	var path = "user://" + account_name + ".bin"
	
	if file.file_exists(path):
		var err = file.open_encrypted_with_pass(path, 
				File.READ, temporal_password)
		account_data = file.get_var()
		file.close()
		
		return true

# Retorna verdadero si guarda la data y falso si no la guarda
func save_account_data(account_name):
	account_data_is_loaded = false
	
	var file = File.new()
	var path = "user://" + account_name + ".bin"
	
	if file.file_exists(path):
		var err = file.open_encrypted_with_pass(path, 
				File.WRITE, temporal_password)
		# Sacar la data de un archivo antes de almacenarla
		file.store_var(account_data)
		file.close()
		
		return true
		
	return false
	
# Esto es para poder ejecutar la escena individualmente,
# requiere al menos un profile guardado en disco.
func load_alternative_data():
	if get_account_data() == null:
		load_account_data(accounts[0])
		Main.set_current_account(accounts[0])
	else:
		print("No se ha cargado la data alternativa")

# 
func change_current_account(account_name):
	print("--- Change current account ---")
	print("account_name: ", account_name)
	
#	save_account_data(account_name)
	
	if current_account != account_name:
		current_account = account_name
		
		load_account_data(account_name)
	else:
		print("--- La cuenta no ha cambiado ---")

func get_account_data():
	return account_data