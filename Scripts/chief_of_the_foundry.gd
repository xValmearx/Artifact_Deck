extends BaseCard

@export var base_power = 2
@export var base_toughness = 3
@export_enum("Creature", "Spell", "Artifact")
var card_type: String = "Artifact"


func _ready() -> void:
	super()
	
	power = base_power
	toughness = base_toughness
	CardType = card_type
	
	# special function to emit multiple of the same signal safely
	MainScene.emit_chief_safely(self)
	
	update_label()
	MainScene.increase_AnE_amount.emit()
