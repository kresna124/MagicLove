extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Area2D_body_entered(body, delay = 0.5):
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Dungeon/FileTscn/level2.tscn")
	pass # Replace with function body.
