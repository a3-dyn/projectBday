extends Area3D

@onready var Manager = %GameManager

func _on_body_entered(body: Node3D) -> void:
	queue_free()
	Manager.add_point(1)
