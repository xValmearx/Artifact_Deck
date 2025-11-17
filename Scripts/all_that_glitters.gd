extends Node2D


func _ready() -> void:
	MainScene.increase_AnE_amount.connect(increase_buff)
	MainScene.decrease_AnE_amount.connect(decrease_buff)
	
	
	var parent = self.get_parent()
	await get_tree().process_frame
	parent.destroyed.connect(remove_buff)
	
	MainScene.increase_AnE_amount.emit()
	
func increase_buff():
	var parent = self.get_parent()
	
	parent.power += 1
	parent.toughness += 1
	
	parent.update_label()
	
func decrease_buff():
	var parent = self.get_parent()
	
	parent.power -= 1
	parent.toughness -= 1
	
	parent.update_label()

func remove_buff():
	var parent = self.get_parent()
	
	parent.power -= MainScene.total_amount_of_artifacts_and_enchantments
	parent.toughness -= MainScene.total_amount_of_artifacts_and_enchantments
	MainScene.decrease_AnE_amount.emit()
	
	parent.update_label()
	
	queue_free()
	
	
