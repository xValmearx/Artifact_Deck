extends Node2D

# this is the chief of the foundry node that is buffing the other nodes
@onready var chief_pointer = null


func apply_buff(node):
	chief_pointer = node
	
	var parent = self.get_parent()
	
	# if the chief that is buffing all the other nodes dies, remove this buff
	chief_pointer.destroyed.connect(remove_buff)
	
	parent.power += 1
	parent.toughness += 1
	
	parent.update_label()
	
func remove_buff():
	var parent = self.get_parent()
	
	parent.power -= 1
	parent.toughness -= 1
	
	parent.update_label()
