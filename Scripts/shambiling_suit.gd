extends BaseCard

@export var base_power = 0
@export var base_toughness = 3
@export_enum("Creature", "Spell", "Artifact")
var card_type: String = "Artifact"


func _ready() -> void:
	super()
	MainScene.increase_AnE_amount.connect(increase_power)
	MainScene.decrease_AnE_amount.connect(decrease_power)
	
	
	
	power = MainScene.total_amount_of_artifacts_and_enchantments
	toughness = base_toughness
	CardType = card_type
	
	update_label()
	MainScene.increase_AnE_amount.emit()
	
func increase_power():
	power += 1
	update_label()
	
func decrease_power():
	power -= 1
	update_label()
