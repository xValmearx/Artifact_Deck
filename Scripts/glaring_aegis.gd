extends Node2D

func _ready() -> void:
	
	var parent = self.get_parent()
	
	# wait a frame, this gives the program time to process the cards read fuction then do this function
	await get_tree().process_frame
	parent.destroyed.connect(remove_buff)
	
	parent.power += 1
	parent.toughness += 3
	parent.update_label()
	
	MainScene.increase_AnE_amount.emit()
	
	
func remove_buff():
	var parent = self.get_parent()
	
	parent.power -= 1
	parent.toughness -= 3
	parent.update_label()
	
	MainScene.decrease_AnE_amount.emit()
	queue_free()
