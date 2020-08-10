extends Panel#"res://src/scenes/ClosingPanel.gd"

#warning-ignore-all:return_value_discarded
onready var submodules = []
func _ready():
	add_close_button($saveloadpanel)
	add_close_button($Options)
	add_close_button(self)
	$VBoxContainer/Save.connect('pressed', $saveloadpanel, 'SavePanelOpen')
	$VBoxContainer/Load.connect('pressed', $saveloadpanel, 'LoadPanelOpen')
	$VBoxContainer/Load.connect('pressed', self, 'append_saveload')
	$VBoxContainer/Save.connect('pressed', self, 'append_saveload')
	$VBoxContainer/Options.connect('pressed', self, 'OptionsOpen')
	$VBoxContainer/Exit.connect('pressed', self, 'Exit')
	move_child($InputBlock, 0)
	for i in $VBoxContainer.get_children():
		i.connect("pressed", self, "PlayClickSound")

func open():
	show()

func OptionsOpen():
	if !submodules.has($Options):
		submodules.append($Options)
	$Options.open()

func append_saveload():
	if !submodules.has($saveloadpanel):
		submodules.append($saveloadpanel)

func PlayClickSound():
	input_handler.PlaySound("button_click")


func Exit():
	input_handler.get_spec_node(input_handler.NODE_CONFIRMPANEL, [self, 'MainMenu', tr('LEAVECONFIRM')])
	#input_handler.ShowConfirmPanel(self, 'MainMenu', tr('LEAVECONFIRM'))

func MainMenu():
	globals.return_to_main_menu()


func add_close_button(scene):
	var pos_in_tree = scene.get_child_count() - 2
	scene.rect_pivot_offset = Vector2(rect_size.x/2, rect_size.y/2)
	var closebutton = load(ResourceScripts.scenedict.close).instance()
	scene.add_child(closebutton)
	scene.move_child(closebutton, pos_in_tree)
	closebutton.connect("pressed", self, 'close_scene', [scene])
	var rect = scene.get_global_rect()
	var pos = Vector2(rect.end.x - closebutton.rect_size.x, rect.position.y)
	closebutton.rect_global_position = pos


func close_scene(scene):
	var GUIWorld = input_handler.get_spec_node(input_handler.NODE_GUI_WORLD, null, false, false)
	GUIWorld.menu_opened = false
	scene.hide()
