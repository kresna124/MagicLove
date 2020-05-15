extends Control

onready var healt_bar = $darah

func _on_healt_update(darah, amount):
	healt_bar.value = darah
	
func _on_max_healt_update(MaxDarah):
	healt_bar.max_value = MaxDarah
