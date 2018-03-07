# PlayerStats.gd

extends Node

export (int) var level = 1
export (int) var xp_total = 0
export (int) var xp_for_next_level = 30

# Factor de incremento de stats
#

export (float) var inc_power = 0.2 # El daño de bala
export (float) var inc_ship_velocity = 0.2 # La velocidad de la nave 
export (float) var inc_fire_velocity = 0.2 # Velocidad de fuego
export (float) var inc_explosive_bullet = 0.2 # Mejora el daño de bala por explosion
export (float) var inc_protection = 0.2 # Mejora la vitalidad
# Energy
export (float) var inc_money_luck = 0.2 # Suerte para recoger dinero
export (float) var inc_item_luck = 0.2 # Suerte para recoger items
# export (float) var inc_shield = 1 # Escudo # TODO

# Puntaje asignado por el jugador
#

export (int) var points_power = 0 # El daño de bala
export (int) var points_ship_velocity = 0 # La velocidad de la nave 
export (int) var points_fire_velocity = 0 # Velocidad de fuego
export (int) var points_explosive_bullet = 0 # Mejora el daño de bala por explosion
export (int) var points_protection = 0 # Mejora la vitalidad
# Energy
export (int) var points_money_luck = 0 # Suerte para recoger dinero
export (int) var points_item_luck = 0 # Suerte para recoger items

# Stats resultado

var stats = {
	"Power" : 0,
	"ShipVelocity" : 0,
	"FireVelocity" : 0,
	"ExplosiveBullet" : 0,
	"Protection" : 0,
	"MoneyLuck" : 0,
	"ItemLuck" : 0
}

func _ready():
	update_stats()
	
func update_stats():
	stats["Power"] = 1 + points_power * inc_power
	stats["ShipVelocity"] = 2.5 + points_power * inc_power
	stats["FireVelocity"] = 600 + points_power * inc_power
	stats["ExplosiveBullet"] = 1 + points_power * inc_power # TOOD
	stats["Protection"] = 10 + points_power * inc_power 
	stats["MoneyLuck"] = 1 + points_power * inc_power # TODO
	stats["ItemLuck"] = 1 + points_power * inc_power # TODO