extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const GRAVITY = 10
const SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity2  = Vector2()
export var darah = 50
var direction = 1
var is_dead= false
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("healt_bar").max_value = darah
	pass # Replace with function body.

func dead():
	if darah == 0 :
		is_dead = true
		velocity2 = Vector2(0,0)
		$AnimatedSprite.play("dead")
		$CollisionShape2D.disabled = true
		$Timer.start()
	else:
		darah = darah - 10
		get_node("healt_bar").value = darah
		print(darah)
	
func _physics_process(delta):
	if is_dead== false :
		velocity2.x = SPEED * direction
		
		if direction ==1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
			
		$AnimatedSprite.play("jalan")
		
		velocity2.y += GRAVITY
		
		velocity2 = move_and_slide(velocity2, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
		$rotasi.position.x *= -1

	if $rotasi.is_colliding() == false:
		direction = direction * -1
		$rotasi.position.x *= -1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Timer_timeout():
	queue_free()


func _on_healt_bar_value_changed(value):
	pass # Replace with function body.
