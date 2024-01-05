extends Node3D

@export var turret: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_turret = turret.instantiate()
	add_child(new_turret)


func build_turret(turret_position: Vector3) -> void:
	var new_turret = turret.instantiate()
	new_turret.global_position = turret_position
	add_child(new_turret)
