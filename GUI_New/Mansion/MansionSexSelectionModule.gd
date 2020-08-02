extends Panel


onready var GUIWorld = input_handler.get_spec_node(input_handler.NODE_GUI_WORLD, null, false)


func _ready():
	$SexButton.connect("pressed", self, "start_scene")
	$DateButton.connect("pressed", self, "start_date")


func start_scene():
	var choosen_chars = get_parent().sex_participants
	# var newscene = interaction.instance()
	ResourceScripts.game_globals.daily_interactions_left -= 1
	GUIWorld.set_current_scene(GUIWorld.gui_data["INTERACTION"].main_module)
	GUIWorld.gui_data["INTERACTION"].main_module.startsequence(choosen_chars)
	# get_parent().add_child(newscene)
	# newscene.startsequence(sex_participants)
	# hide()


func start_date():
	var person = get_parent().sex_participants[0]
	get_parent().get_node("date").show()
	get_parent().get_node("date").initiate(person)
