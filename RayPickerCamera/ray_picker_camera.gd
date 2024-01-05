extends Camera3D


@export var clickable_range: float = 100
@export var gridmap: GridMap

@onready var ray_cast_3d: RayCast3D = $RayCast3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * clickable_range 
	ray_cast_3d.force_raycast_update()

	if ray_cast_3d.is_colliding():
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap:
			var collision_point: Vector3 = ray_cast_3d.get_collision_point()
			var cell: Vector3i = gridmap.local_to_map(collision_point)
			if gridmap.get_cell_item(cell) == 0:
				gridmap.set_cell_item(cell, 1)
