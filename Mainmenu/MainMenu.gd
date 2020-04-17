extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_playBtn_pressed():
	get_tree().change_scene("res://Mainmenu/Dungeon.tscn")
	pass # Replace with function body.


func _on_btnExit_pressed():
	pass # Replace with function body.


func _on_lvl1_pressed():
	get_tree().change_scene("res://Dungeon/FileTscn/level1.tscn")
	pass # Replace with function body.


func _on_lvl2_pressed():
	get_tree().change_scene("res://Dungeon/FileTscn/level2.tscn")
	pass # Replace with function body.


func _on_lvl3_pressed():
	get_tree().change_scene("res://Dungeon/FileTscn/level3.tscn")
	pass # Replace with function body.


func _on_lvl4_pressed():
	get_tree().change_scene("res://Dungeon/FileTscn/level4.tscn")
	pass # Replace with function body.


func _on_lvl5_pressed():
	get_tree().change_scene("res://Dungeon/FileTscn/level5.tscn")
	pass # Replace with function body.


func _on_lvl6_pressed():
	get_tree().change_scene("res://Dungeon/FileTscn/level6.tscn")
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene("res://Mainmenu/Mainmenu.tscn")
	pass # Replace with function body.
