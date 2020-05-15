extends KinematicBody2D

signal health_updated(darah)
signal killed()
const PANAH = preload("res://Dungeon/player/panah.tscn")
const FLOOR_NORMAL : = Vector2(0, -1)
onready var healt_bar = $darah

var gravity : = 10
var speed : = 150.0
var velocity : = Vector2()
var target_speed : = 0.0
var jump_speed : = -300.0

var is_dead = false
var nembak = false
export var darah = 100 

onready var animated_sprite : = $AnimatedSprite as AnimatedSprite



	
func _process(delta: float) -> void:
	
		
	if is_dead == false:
		if velocity.x > 0:
			if nembak == false:
				animated_sprite.flip_h = false
				if sign($Position2D.position.x)== -1:
					$Position2D.position.x *= -1
				
		elif velocity.x < 0:
			if nembak == false:
				animated_sprite.flip_h = true
				if sign($Position2D.position.x)== 1:
					$Position2D.position.x *= -1
				
	
		if velocity.x != 0 && nembak == false:
			animated_sprite.play("lari")
		else:
			if nembak == false :
				animated_sprite.play("diam")
	
		if !is_on_floor():
			if nembak == false :
				animated_sprite.play("lompat")
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "ogre" in get_slide_collision(i).collider.name:
					darah = darah - 5
					get_node("healt_bar").value = darah
					dead()
					print(darah)
				if "ogre1" in get_slide_collision(i).collider.name:
					darah = darah - 5
					get_node("healt_bar").value = darah
					dead()
					print(darah)
				if "ogre2" in get_slide_collision(i).collider.name:
					darah = darah - 5
					get_node("healt_bar").value = darah
					dead()
					print(darah)
				if "ogre3" in get_slide_collision(i).collider.name:
					darah = darah - 5
					get_node("healt_bar").value = darah
					dead()
					print(darah)
				if "ogre4" in get_slide_collision(i).collider.name:
					darah = darah - 5
					get_node("healt_bar").value = darah
					dead()
					print(darah)
				if "ogre5" in get_slide_collision(i).collider.name:
					darah = darah - 5
					get_node("healt_bar").value = darah
					dead()
					print(darah)
				if "ogre6" in get_slide_collision(i).collider.name:
					darah = darah - 5
					get_node("healt_bar").value = darah
					dead()
					print(darah)
				if "ogre7" in get_slide_collision(i).collider.name:
					darah = darah - 5
					get_node("healt_bar").value = darah
					dead()
					print(darah)
				if "ogre8" in get_slide_collision(i).collider.name:
					darah = darah - 5
					get_node("healt_bar").value = darah
					dead()
					print(darah)
				
func dead() :
	if darah <= 0 :
		is_dead = true
		velocity = Vector2(0, 0)
		animated_sprite.play("mati")
		$Timer.start()
	else :
		animated_sprite.play("kena")
	
func _on_healt_bar_value_changed(darah):
	pass # Replace with function body.
	
func _physics_process(delta: float) -> void:
	get_inputs()

	velocity.y = velocity.y + gravity

	velocity.x = lerp(velocity.x, target_speed, .4)

	if abs(velocity.x) < 1:
		velocity.x = 0

	velocity = move_and_slide(velocity, FLOOR_NORMAL)


	
func get_inputs() -> void:
	if Input.is_action_pressed("ui_up") && is_on_floor():
		velocity.y = jump_speed
	elif Input.is_action_pressed("ui_down") && nembak == false:
		nembak= true
		$AnimatedSprite.play("nembak")
		var tembak = PANAH.instance()
		if sign($Position2D.position.x) == 1:
			tembak.set_panah_direction(1)
		else :
			tembak.set_panah_direction(-1)
		get_parent().add_child(tembak)
		tembak.position = $Position2D.global_position
	
	target_speed = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed
	
	



func _on_Timer_timeout():
	get_tree().change_scene("res://Mainmenu/Dungeon.tscn")
	pass # Replace with function body.
	
	
func _on_max_healt_update(darah):
	healt_bar.max_value = darah


func _on_AnimatedSprite_animation_finished():
	nembak = false
