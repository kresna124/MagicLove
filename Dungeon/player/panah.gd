extends Area2D

const SPEED = 500
var velocity = Vector2()
var direction = 1

func _ready():
	pass 

func set_panah_direction(dir):
	direction = dir 
	if dir == -1:
		$AnimatedSprite.flip_h = true
	
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shoot")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_panah_body_entered(body):
	if "ogre" in body.name:
		body.dead()
	elif "ogre1" in body.name:
		body.dead()
	elif "ogre2" in body.name:
		body.dead()
	elif "ogre3" in body.name:
		body.dead()
	elif "ogre4" in body.name:
		body.dead()
	elif "ogre5" in body.name:
		body.dead()
	elif "ogre6" in body.name:
		body.dead()
	elif "ogre7" in body.name:
		body.dead()
	elif "ogre8" in body.name:
		body.dead()
	queue_free()
