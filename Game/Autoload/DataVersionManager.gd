# DataVersionManager.gd

# Crea nueva data y gestiona los cambios de version en la data. Por ejemplo,
# en la version 1 se crea toda la data, luego en la version 2 se desea anadir
# energia al player. Entonces se debe ejecutar la funcion
# create_data("version_2")

extends Node

var data

func _ready():
	data = Persistence.get_data()

func create_data(version):
	match version:
		"v0.1.0": create_data_001()
		
func create_data_001():
	
	# Crear la data del player
	
	Main.player.name = "Goodship"
	Main.player.level = 0
	Main.player.level_max = 30
	Main.player.hp = 10
	Main.player.max_hp = 10
	Main.player.energy = 10 # TODO: A futuro se utilizara energia
	Main.player.max_energy = 10
	
	Main.save_player_data()
	
	# Crear data de las stats
	
	Main.stats.add_stat("Damage", 0, 50)
	Main.stats.add_stat("ShipVelocity", 0, 25)
	Main.stats.add_stat("FireVelocity", 0, 25)
	Main.stats.add_stat("ExplosiveBullet", 0, 50)
	Main.stats.add_stat("Protection", 0, 50)
	
	Main.save_stats_data()
	
	# Otra Data
	
	data["Coins"] = 25 # TODO: Definir un numero de coins al inicio
	data["PastLevels"] = 0 # Niveles pasados
	data["Keys"] = 0 # TODO: En un futuro se anadiran keys para abrir cofres
	data["Skins"] = {
		SkinsObtained = [Shop.get_random_spaceship_skin()],
		SkinSelected = 0
	}
	
	Persistence.save_data()