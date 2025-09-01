extends Node3D

var POINTS = 0
func add_point(val: int):
	POINTS += val
	print(POINTS)
	
func _ready():
	print("done")
	
