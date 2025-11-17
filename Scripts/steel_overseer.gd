extends BaseCard

@export var base_power = 1
@export var base_toughness = 1
@export_enum("Creature", "Spell", "Artifact")
var card_type: String = "Artifact"


func _ready() -> void:
	super()
	
	power = base_power
	toughness = base_toughness
	CardType = card_type
	
	update_label()
	MainScene.increase_AnE_amount.emit()


func _on_increase_artifacts_pressed() -> void:
	MainScene.overseer.emit()
