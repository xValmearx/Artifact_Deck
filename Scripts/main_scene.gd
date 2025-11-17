extends Node2D

# signals that cards will emit
signal chief_entered(node)
signal overseer

# signal to calculat the amount of artifacts entered and exited
signal increase_AnE_amount
signal decrease_AnE_amount


# AnE for short
@export var total_amount_of_artifacts_and_enchantments = 0

func _enter_tree() -> void:
	increase_AnE_amount.connect(increase_AnE)
	decrease_AnE_amount.connect(decrease_Ane)

# creats a small delay to emit one signal per frame
func emit_chief_safely(card):
	await get_tree().process_frame
	emit_signal("chief_entered", card)
	
func increase_AnE():
	total_amount_of_artifacts_and_enchantments += 1
func decrease_Ane():
	total_amount_of_artifacts_and_enchantments -= 1
