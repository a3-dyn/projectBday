extends Area3D

@onready var KillZone = $KillZone

func _on_body_entered(body: Node3D) -> void:
	print("Oops")
	get_tree().reload_current_scene()
