extends Node2D

func _ready() -> void:
	MainScene.increase_AnE_amount.emit()
	



func _on_delete_pressed() -> void:
	MainScene.decrease_AnE_amount.emit()
	
	queue_free()
