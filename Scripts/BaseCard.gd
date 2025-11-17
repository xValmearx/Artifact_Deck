extends Node

class_name  BaseCard

@onready var power = 0
@onready var toughness = 0
@onready var CardType = null
@onready var ChiefBuff = preload('res://buffs/Chief_Buff.tscn')

var draging

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
