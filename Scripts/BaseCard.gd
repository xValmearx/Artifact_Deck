extends Node

class_name  BaseCard

@onready var power = 0
@onready var toughness = 0
@onready var CardType = null

@onready var ChiefBuff = preload('res://buffs/Chief_Buff.tscn')


signal destroyed


func _ready() -> void:
	# connect deferred creates a stack (first in last out) of signals to be called
	MainScene.chief_entered.connect(process_chief_entered,CONNECT_DEFERRED)
	MainScene.overseer.connect(process_overseer)
	
	
func process_chief_entered(node):
	if node == self:
		return
	elif CardType == "Artifact":
		var buff_instance = ChiefBuff.instantiate()
		
		self.add_child(buff_instance)
		
		buff_instance.apply_buff(node)
func process_overseer():
	if CardType != 'Artifact':
		return
	power += 1
	toughness += 1
	update_label()

func update_label():
	
	var label = $Control/Panel/Label
	var new_text = "{0} / {1}".format([power, toughness])

	label.text = new_text

func _on_delete_pressed() -> void:
	destroyed.emit()
	
	if CardType == "Artifact":
		MainScene.decrease_AnE_amount.emit()
	queue_free()
func _on_add_pressed() -> void:
	power += 1
	toughness += 1
	
	update_label()
func _on_sub_pressed() -> void:
	power -= 1
	toughness -= 1
	
	update_label()
