extends Node2D


const GRAVITY = 10
const SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity2  = Vector2()

func _ready():
	pass

func _physics_process(delta):
	$AnimatedSprite.play("coin")
	pass # Replace with function body.
	
func _on_Area2D_body_entered(body):
	if "body" in body.name:
		$Area2D/CollisionShape2D.disabled = true
		print("ambil")
		body.coin = body.coin + 10
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
