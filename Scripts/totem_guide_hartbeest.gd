extends BaseCard

@export var base_power = 2
@export var base_toughness = 5
@export_enum("Creature", "Spell", "Artifact")
var card_type: String = "Creature"


func _ready() -> void:
	super()
	
	power = base_power
	toughness = base_toughness
	CardType = card_type
	
	update_label()
