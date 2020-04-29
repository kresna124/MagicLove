extends KinematicBody2D

const FLOOR_NORMAL : = Vector2(0, -1)

var gravity : = 10
var speed : = 150.0
var velocity : = Vector2()
var target_speed : = 0.0
var jump_speed : = -300.0

var is_dead = false

onready var animated_sprite : = $AnimatedSprite as AnimatedSprite


func _process(delta: float) -> void:
	if is_dead == false:
		if velocity.x > 0:
			animated_sprite.flip_h = false
		elif velocity.x < 0:
			animated_sprite.flip_h = true
	
		if velocity.x != 0:
			animated_sprite.play("lari")
		else:
			animated_sprite.play("diam")
	
		if !is_on_floor():
			animated_sprite.play("lompat")
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "ogre" in get_slide_collision(i).collider.name:
					dead()
				if "ogre2" in get_slide_collision(i).collider.name:
					dead()
				if "ogre3" in get_slide_collision(i).collider.name:
					dead()

func dead() :
	is_dead = true
	velocity = Vector2(0, 0)
	animated_sprite.play("mati")
	$Timer.start()
	
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

	target_speed = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed



func _on_Timer_timeout():
	get_tree().change_scene("res://Mainmenu/Dungeon.tscn")
	pass # Replace with function body.
