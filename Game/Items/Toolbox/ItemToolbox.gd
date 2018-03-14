# ItemToolbox.gd

extends "../ItemConsumable.gd"

enum Toolbox {TOOLBOX_5, TOOLBOX_10, TOOLBOX_15, TOOLBOX_20}
var toolbox

func _ready():
	pass

func create_toolbox(Toolbox):
	match Toolbox:
		Toolbox.TOOLBOX_5:
			pass
		Toolbox.TOOLBOX_10:
			pass
		Toolbox.TOOLBOX_15:
			pass
		Toolbox.TOOLBOX_20:
			pass