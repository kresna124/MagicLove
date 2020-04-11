extends KinematicBody2D


const GRAVITY = 10
const SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity2  = Vector2()

func _ready():
	pass

func _physics_process(delta):
	$AnimatedSprite.play("perempuan")
	
