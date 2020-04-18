extends Node

var person

func hairdye(character):
	person = character
	var node = input_handler.get_spec_node(input_handler.NODE_TEXTEDIT) #input_handler.GetTextEditNode()
	node.open(self, 'set_hair_color', person.hair_color, person.translate("Select new hair color for [name]"))

func set_hair_color(text):
	person.hair_color = text
	input_handler.update_slave_panel()

func minorus_potion(character):
	person = character
	input_handler.interactive_message("minorus_potion_select",'custom_effect', {})
func majorus_potion(character):
	person = character
	input_handler.interactive_message("majorus_potion_select",'custom_effect', {})

func minorus_tits():
	var character = person
	if !character.tits_size in ['masculine','flat']:
		character.tits_size = variables.slave_basic_sizes[variables.slave_basic_sizes.find(character.tits_size) - 1]
		input_handler.interactive_message("minorus_potion_tits",'char_translate',character)
	else:
		input_handler.interactive_message("potion_no_effect", '', {})
	input_handler.update_slave_panel()
func minorus_ass():
	var character = person
	if !character.ass_size in ['masculine','flat']:
		character.ass_size = variables.slave_basic_sizes[variables.slave_basic_sizes.find(character.ass_size) - 1]
		input_handler.interactive_message("minorus_potion_ass",'char_translate',character)
	else:
		input_handler.interactive_message("potion_no_effect", '', {})
	input_handler.update_slave_panel()
func minorus_balls():
	var character = person
	if !character.balls_size in ['small']:
		character.balls_size = variables.slave_genital_sizes[variables.slave_genital_sizes.find(character.balls_size) - 1]
		input_handler.interactive_message("minorus_potion_balls",'char_translate',character)
	else:
		input_handler.interactive_message("potion_no_effect", '', {})
	input_handler.update_slave_panel()
func minorus_penis():
	var character = person
	if !character.penis_size in ['small']:
		character.penis_size = variables.slave_genital_sizes[variables.slave_genital_sizes.find(character.penis_size) - 1]
		input_handler.interactive_message("minorus_potion_balls",'char_translate',character)
	else:
		input_handler.interactive_message("potion_no_effect", '', {})
	input_handler.update_slave_panel()

func majorus_tits():
	var character = person
	if !character.tits_size in ['huge']:
		character.tits_size = variables.slave_basic_sizes[variables.slave_basic_sizes.find(character.tits_size) + 1]
		input_handler.interactive_message("majorus_potion_tits",'char_translate',character)
	else:
		input_handler.interactive_message("potion_no_effect", '', {})
	input_handler.update_slave_panel()
func majorus_ass():
	var character = person
	if !character.ass_size in ['huge']:
		character.ass_size = variables.slave_basic_sizes[variables.slave_basic_sizes.find(character.ass_size) + 1]
		input_handler.interactive_message("majorus_potion_ass",'char_translate',character)
	else:
		input_handler.interactive_message("potion_no_effect", '', {})
	input_handler.update_slave_panel()
func majorus_balls():
	var character = person
	if !character.balls_size in ['big']:
		character.balls_size = variables.slave_genital_sizes[variables.slave_genital_sizes.find(character.balls_size) + 1]
		input_handler.interactive_message("majorus_potion_balls",'char_translate',character)
	else:
		input_handler.interactive_message("potion_no_effect", '', {})
	input_handler.update_slave_panel()
func majorus_penis():
	var character = person
	if !character.penis_size in ['big']:
		character.penis_size = variables.slave_genital_sizes[variables.slave_genital_sizes.find(character.penis_size) + 1]
		input_handler.interactive_message("majorus_potion_balls",'char_translate',character)
	else:
		input_handler.interactive_message("potion_no_effect", '', {})
	input_handler.update_slave_panel()

func writ_of_exemption(character):
	person = character
	input_handler.active_character = person
	input_handler.interactive_message("writ_of_exemption",'custom_effect', {})

func writ_of_exemption_use():
	var character = person
	var acceptance_req = 100
	var acceptance_chance = 0
	state.remove_item("writ_of_exemption", 1)
	input_handler.get_spec_node(input_handler.NODE_INVENTORY, [{mode = 'character', person = person}]).hide()
	input_handler.scene_characters = [person]
	if character.loyalty == 100 && character.submission == 100:
		acceptance_chance = 100
	else:
		acceptance_chance = (character.loyalty + character.submission) / 2
		acceptance_chance = acceptance_chance - acceptance_chance*variables.personality_conversion_rates[character.personality]
	if acceptance_chance >= randf()*acceptance_req:
		input_handler.interactive_message("writ_of_exemption_success",'char_translate',character)
		character.set_slave_category('servant')
		character.loyalty += 25
	else:
		input_handler.interactive_message("writ_of_exemption_failure",'char_translate',character)
		state.remove_slave(character)
	input_handler.update_slave_panel()
	input_handler.rebuild_slave_list()

func close():#for the cancel function
	input_handler.get_spec_node(input_handler.NODE_DIALOGUE).hide()
