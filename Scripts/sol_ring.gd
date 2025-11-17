extends Node2D

var draging


func _ready() -> void:
	MainScene.increase_AnE_amount.emit()
	



func _on_delete_pressed() -> void:
	MainScene.decrease_AnE_amount.emit()
	
	queue_free()


# dragging card around
func _process(delta: float) -> void:
	if draging:
		var mouse_pos = get_viewport().get_mouse_position()
		
		var calc_x_pos = clamp(mouse_pos.x,MainScene.screen_boundary_num,MainScene.screen_size.x - MainScene.screen_boundary_num)
		var calc_y_pos = clamp(mouse_pos.y,MainScene.screen_boundary_num,MainScene.screen_size.y - MainScene.screen_boundary_num)
		
		self.global_position = Vector2(calc_x_pos,calc_y_pos)
func _on_drag_area_button_down() -> void:
	draging = true
func _on_drag_area_button_up() -> void:
	draging = null
