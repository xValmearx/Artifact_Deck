extends TextureRect

@export var spawn_scene: PackedScene  # set this in the inspector

var dragging := false

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				set_mouse_filter(MOUSE_FILTER_IGNORE) # let mouse events go through
			else:
				if dragging:
					dragging = false
					drop_item(get_global_mouse_position())
				set_mouse_filter(MOUSE_FILTER_STOP)
	elif event is InputEventMouseMotion and dragging:
		# Move with the mouse
		global_position = event.global_position

func drop_item(mouse_pos: Vector2) -> void:
	# Convert screen → world
	var world_pos = get_viewport().get_camera_2d().screen_to_world(mouse_pos)

	# Spawn object
	var obj = spawn_scene.instantiate()
	obj.position = world_pos

	# Add to the world
	get_tree().get_root().get_node("Main/World").add_child(obj)
