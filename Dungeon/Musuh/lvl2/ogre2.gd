extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const GRAVITY = 10
const SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity2  = Vector2()

var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
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
