extends Node

var player_stats

func _ready():
#	Persistence.load_alternative_data()
#
##	Persistence.load_account_data(Main.get_current_account())
#	player_stats = Persistence.get_account_data()["PlayerStats"]
	
	$CoinImg.playing = true
	
	update_stats()
	
func update_stats():
#	$Name.text = str(Persistence.get_account_data()["Owner"])
	
	$Level.text = str("Level: ") + str(player_stats.level)
	$StatsPanel/Margin/VBox/GridContainer/ValueMaxHP.text = str(player_stats.max_hp)
	$StatsPanel/Margin/VBox/GridContainer/ValueMaxEnergy.text = str(player_stats.max_energy)
	$StatsPanel/Margin/VBox/GridContainer/ValueExperience.text = str(player_stats.xp_total) + " / " + str(player_stats.xp_for_next_level)
	
	$StatsPanel/Margin/VBox/Grid/ValuePower.text = str(player_stats.stats["Power"])
	$StatsPanel/Margin/VBox/Grid/ValueShipVelocity.text = str(player_stats.stats["ShipVelocity"])
	$StatsPanel/Margin/VBox/Grid/ValueFireVelocity.text = str(player_stats.stats["FireVelocity"])
	$StatsPanel/Margin/VBox/Grid/ValueExplosiveBullet.text = str(player_stats.stats["ExplosiveBullet"])
	$StatsPanel/Margin/VBox/Grid/ValueProtection.text = str(player_stats.stats["Protection"])
	$StatsPanel/Margin/VBox/Grid/ValueEnergy.text = str(player_stats.stats["Energy"])
	$StatsPanel/Margin/VBox/Grid/ValueMoneyLuck.text = str(player_stats.stats["MoneyLuck"])
	$StatsPanel/Margin/VBox/Grid/ValueItemLuck.text = str(player_stats.stats["ItemLuck"])
	
	$CoinsAmount.text = str(Persistence.get_account_data()["Coins"])
	
func _on_Back_pressed():
	get_tree().change_scene("res://Game/MainScreens/Accounts.tscn")

func _on_Continue_pressed():
	get_tree().change_scene("res://Game/Levels/LevelMode.tscn")
