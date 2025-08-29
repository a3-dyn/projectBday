extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 6.5

@onready var sprite: AnimatedSprite3D = $AnimatedSprite3D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	velocity.x = direction.x * SPEED if direction else move_toward(velocity.x, 0, SPEED)
	# velocity.z = direction.z * SPEED if direction else move_toward(velocity.z, 0, SPEED)
	
	if direction.x:
		sprite.play("run")
		if direction.x > 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
	else:
		sprite.play("idle")

	move_and_slide()
