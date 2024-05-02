extends CharacterBody2D

@onready
var player = get_node("/root/Game/CharacterBody2D")

var health = 1

func _ready():
	pass

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 200
	move_and_slide()

func take_damage():
	health -= 1
	
	if health == 0:
		queue_free()
		
		const SMOKE_SCREEN = preload("res://explosion.tscn")
		var smoke = SMOKE_SCREEN.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
