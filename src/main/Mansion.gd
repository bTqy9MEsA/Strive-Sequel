extends Control

#warning-ignore-all:return_value_discarded
var gamepaused_nonplayer = false
var gamepaused = false
var gamespeed = 0
var gametime = 0
var previouspeed = 0
onready var timebuttons = [$"TimeNode/0speed", $"TimeNode/1speed", $"TimeNode/2speed"]

func timeflowhotkey(hotkey):
	match hotkey:
		1: advance_turn()
		2: decrease_turns()
		3: increase_turns()

func advance_turn():
	input_handler.PlaySound("button_click")
	var number = game_globals.hour_turns_set
	while number > 0:
		advance_hour()
		number -= 1

func decrease_turns():
	globals.hour_turns_set = max(globals.hour_turns_set - 1, 1)
	update_turns_label()

func increase_turns():
	globals.hour_turns_set = min(globals.hour_turns_set + 1, variables.hour_turn_limit)
	update_turns_label()

func update_turns_label():
	$TimeNode/turns.text = str(globals.hour_turns_set)

func _ready():
	input_handler.CurrentScene = self
	input_handler.CurrentScreen = 'mansion'
	update_turns_label()
	if OS.get_executable_path() == "D:\\Program Files2\\godot_bin\\Godot_v3.2-stable_win64.exe":# && false:
		variables.generate_test_chars = true
		variables.allow_remote_intereaction = true
		variables.combat_tests = true
		variables.unlock_all_upgrades = true
		variables.skip_combat = false
		#$UpgradeList._ready()
		$TestButton.show()
	
	
	var speedvalues = [0,1,5]
	var tooltips = [tr('PAUSEBUTTONTOOLTIP'),tr('NORMALBUTTONTOOLTIP'),tr('FASTBUTTONTOOLTIP')]
	var counter = 0
	for i in timebuttons:
		i.hint_tooltip = tooltips[counter]
		i.connect("pressed",self,'changespeed',[i])
		i.set_meta('value', speedvalues[counter])
		counter += 1
	
	
	$InventoryButton.connect("pressed",self,'open_inventory')
	$CraftButton.connect("pressed",self,"open_craft")
	$ExploreButton.connect("pressed",$Exploration,"open")
	$QuestlogButton.connect("pressed", self, "open_questlog")
	$UpgradeButton.connect("pressed", self, "open_upgrades")
	$TravelButton.connect("pressed", self, "open_travels")
	$MenuButton.connect("pressed", $MenuPanel, "open")
	$InteractButton.connect("pressed", $InteractionSelectPanel, 'open')
	$TimeNode/finish_turn.connect("pressed", self, "advance_turn")
	$TimeNode/lessturn.connect("pressed", self, "decrease_turns")
	$TimeNode/moreturn.connect("pressed", self, "increase_turns")
	
	globals.connecttexttooltip($gold/TextureRect/Control, tr("TOOLTIPGOLD"))
	globals.connecttexttooltip($food/TextureRect/Control, tr("TOOLTIPFOOD"))

	globals.log_node = $Log
	
	game_party.connect("task_added", self, 'build_task_bar')
	yield(get_tree(), 'idle_frame')
	$TimeNode/Date.text = "Day: " + str(game_globals.date) + ", Hour: " + str(game_globals.hour) + ":00"
	if variables.generate_test_chars:
#		state.revert() to remake
		game_world.make_world()
		var character = Slave.new()
		character.create('HalfkinCat', 'male', 'random')
		character.set_stat('consent', 100)
		character.set_stat('penis_virgin', true)
		characters_pool.move_to_state(character.id)
		character.add_trait('core_trait')
		character.unlock_class("master")
		character.unlock_class("archer")
		character.unlock_class("necromancer")
		character.unlock_class("rogue")
		var bow = globals.CreateGearItem("bow", {WeaponHandle = 'wood', BowBase = 'obsidian'})
		globals.AddItemToInventory(bow)
		character.equip(bow)
		character.set_slave_category('master')
		character.statlist.negative_sex_traits = ['dislike_missionary']
		character.statlist.unlocked_sex_traits = ['submissive', 'pushover','bottle_fairy','dominant','sadist','desired','curious','life_power']
		#character.armor = 135
		character.set_stat('wits',20)
		character.set_stat('consent',100)
		character.set_stat('charm_factor',5)
		character.set_stat('physics_factor',5)
		#character.unlock_class("worker")
		character.mp = 50
		character.unlock_class("sadist")
#		character.unlock_class("caster")
		for i in Skilldata.Skilllist:
			if Skilldata.Skilllist[i].type != 'social':
				continue
			character.skills.social_skills.append(i)
		character.is_players_character = true
		globals.impregnate(character, character)
		#character.pregnancy.duration = 2
		
		character = Slave.new()
		character.create('HalfkinCat', 'random', 'random')
		character.set_stat('consent',100)
		character.statlist.negative_sex_traits = ['dislike_missionary']
		characters_pool.move_to_state(character.id)
		#character.unlock_class("attendant")
		character.add_trait('core_trait')
		character.set_slave_category('servant')
		character.set_stat('obedience', 100)
		character.set_stat('lust',50)
		character.is_players_character = true
		character = Slave.new()
		character.create('HalfkinCat', 'random', 'random')
		characters_pool.move_to_state(character.id)
		
#		for i in range(1,20):
#
#			character = Slave.new()
#			character.create('BeastkinCat', 'random', 'random')
#			characters_pool.move_to_state(character.id)
		
		character.set_stat('obedience', 0)
		#character.fear = 25
		#character.base_exp = 99
		character.set_stat('charm_factor' ,5)
		character.set_stat('physics_factor' ,5)
		character.set_stat('wits_factor' ,5)
		character.set_stat('sexuals_factor' , 5)
		character.set_stat('charm' , 100)
		character.set_stat('physics' ,100)
		character.set_stat('wits' , 100)
		
		var character2 = Slave.new()
		character2.create('HalfkinCat', 'random', 'random')
		character2.set_stat('charm' , 0)
		character2.set_stat('physics' ,0)
		character2.set_stat('wits' , 0)
		character2.set_stat('sexuals' , 0)
		var text = ''
		for i in races.tasklist.values():
			for k in i.production.values():
				var value = races.get_progress_task(character, i.code, k.code, true)/k.progress_per_item
				if Items.materiallist.has(k.item):
					pass
#					var item = Items.materiallist[k.item]
#					text += item.name + ": Min " + str(stepify(races.get_progress_task(character2, i.code, k.code, true)/k.progress_per_item*item.price,0.1)) 
#					text += ", Max " + str(stepify(value*item.price,0.1)) + "\n"
				else:
					pass
#					text += k.code + ": Min " + str(stepify(races.get_progress_task(character2, i.code, k.code, true)/k.progress_per_item,0.1)) 
#					text += ", Max " + str(stepify(value,0.1)) + "\n"
#
		var base_price = 0 
		var output_price = 0
		for i in Items.recipes.values():
			base_price = 0
			output_price = 0
			for k in i.materials:
				base_price += Items.materiallist[k].price * i.materials[k]
			for k in i.items:
				base_price += Items.itemlist[k].price * i.items[k]

			if Items.materiallist.has(i.resultitem):
				output_price = Items.materiallist[i.resultitem].price*i.resultamount
				if base_price != 0:
					text += Items.materiallist[i.resultitem].name + ": Cost - " + str(base_price) + ", Return - " + str(output_price) + "\n"
			else:
				output_price = Items.itemlist[i.resultitem].price*i.resultamount
				if base_price != 0:
					text += Items.itemlist[i.resultitem].name + ": Cost - " + str(base_price) + ", Return - " + str(output_price) + "\n"
				
		#print(text)
		character.set_stat('loyalty' , 95)
		character.set_stat('authority' ,100)
		character.set_stat('submission' , 95)
		character.mp = 10
		character.hp = 95
		#character.exhaustion = 1000
		character.add_trait('core_trait')
		character.set_slave_category('slave')
		character.is_players_character = true
		
		#state.revert()
		game_res.money = 505590
		for i in Items.materiallist:
			game_res.materials[i] = 200
		game_res.materials.bandage = 0
		globals.AddItemToInventory(globals.CreateGearItem("handcuffs", {}))
		globals.AddItemToInventory(globals.CreateGearItem("pet_suit", {}))
		globals.AddItemToInventory(globals.CreateGearItem("tail_plug", {}))
		globals.AddItemToInventory(globals.CreateGearItem("maid_dress", {}))
		globals.AddItemToInventory(globals.CreateGearItem("craftsman_suit", {}))
		globals.AddItemToInventory(globals.CreateGearItem("worker_outfit", {}))
		globals.AddItemToInventory(globals.CreateGearItem("lacy_underwear", {}))
		globals.AddItemToInventory(globals.CreateGearItem("animal_gloves", {}))
		globals.AddItemToInventory(globals.CreateGearItem("amulet_of_recognition", {}))
		globals.AddItemToInventory(globals.CreateUsableItem("alcohol"))
		globals.AddItemToInventory(globals.CreateUsableItem("exp_scroll",4))
		globals.AddItemToInventory(globals.CreateUsableItem("writ_of_exemption", 3))
		globals.AddItemToInventory(globals.CreateUsableItem("lifegem", 5))
		globals.AddItemToInventory(globals.CreateUsableItem("energyshard", 2))
		globals.AddItemToInventory(globals.CreateUsableItem("strong_pheromones", 3))
		globals.AddItemToInventory(globals.CreateUsableItem("revitalizer", 3))
		globals.AddItemToInventory(globals.CreateGearItem("bow", {WeaponHandle = 'wood', BowBase = 'obsidian'}))
		globals.AddItemToInventory(globals.CreateGearItem("axe", {ToolHandle = 'wood', ToolBlade = 'obsidian'}))
		globals.AddItemToInventory(globals.CreateGearItem("club", {WeaponMace = 'stone'}))
		globals.AddItemToInventory(globals.CreateGearItem("spear", {WeaponHandle = 'wood', Blade = 'obsidian'}))
		globals.AddItemToInventory(globals.CreateGearItem("pickaxe", {ToolHandle = 'wood', ToolBlade = 'obsidian'}))
		globals.AddItemToInventory(globals.CreateGearItem("hammer", {ToolHandle = 'wood', ToolBlade = 'obsidian'}))
		globals.AddItemToInventory(globals.CreateGearItem("hunt_knife", {ToolHandle = 'wood', ToolBlade = 'obsidian'}))
		globals.AddItemToInventory(globals.CreateGearItem("legs_base_metal", {ArmorBaseHeavy = 'mithril', ArmorTrim = 'wood'}))
		globals.AddItemToInventory(globals.CreateGearItem("chest_base_metal", {ArmorBaseHeavy = 'mithril', ArmorTrim = 'wood'}))
		globals.AddItemToInventory(globals.CreateGearItem("chest_base_cloth", {ArmorBaseCloth = 'clothsilk', ArmorTrim = 'wood'}))
		#$SlaveList.rebuild()
		#state.common_effects([{code = 'make_quest_location', value = 'quest_fighters_lich'}])
		game_progress.show_tutorial = true
#		state.active_quests.append({code = "lich_enc_initiate", stage = 'stage1'})
		#state.decisions = ["fighters_election_support",'mages_election_support','workers_election_support']
	#	state.mainprogress = 0
		game_progress.active_quests.append({code = 'election_global_quest', stage = 'stage1'})
		for i in game_world.areas.plains.factions.values():
			i.totalreputation += 500
		character.unlock_class("pet")
		character.unlock_class("souleater")
		character.mp = 10
		var tmp = {}
		tmp.oral = 70
		tmp.anal = 90
		tmp.petting = 100
		character.set_stat('sex_skills', tmp)
		character.xp_module.base_exp = 500
		#input_handler.get_spec_node(input_handler.NODE_LOOTTABLE).open(world_gen.make_chest_loot('mages_join_reward'), 'Teh Loot')
		#input_handler.get_loot_node().open(world_gen.make_chest_loot('warriors_join_reward'), ' Loot')
		input_handler.active_location = game_world.areas.plains.locations[game_world.areas.plains.locations.keys()[3]]#[state.areas.plains.locations.size()-1]]
		input_handler.active_area = game_world.areas.plains
		#state.decisions = ['fighters_election_support', 'workers_election_support', 'servants_election_support', 'mages_election_support']
		#input_handler.add_random_chat_message(newchar, 'hire')
		#input_handler.interactive_message("starting_dialogue4", '',{})
		
		#input_handler.interactive_message('intro', '', {})
		
		for i in game_world.areas.plains.factions.values():
			i.reputation = 500
		
	elif globals.start_new_game == true:
		globals.start_new_game = false
		self.visible = false
		var newgame_node = Node.new()
		newgame_node.set_script(load("res://src/GameStart.gd"))
		newgame_node.start()
		input_handler.GameStartNode = newgame_node
		yield(input_handler, "StartingSequenceComplete")
		input_handler.GameStartNode.queue_free()
		#globals.AddItemToInventory(globals.CreateGearItem("axe", {ToolHandle = 'wood', ToolBlade = 'stone'}))
		show()
		
		input_handler.ActivateTutorial("introduction")
		if starting_presets.preset_data[game_globals.starting_preset].story == true:
			input_handler.interactive_message('intro', '', {})
	build_task_bar()
	$SlaveList.rebuild()
	
	input_handler.SetMusicRandom("mansion")
	
	input_handler.SystemMessageNode = $SysMessage
	set_time_buttons()
	$TestButton.connect("pressed", self, "quest_test")
	

func open_travels():
	$CharacterDislocationPanel.open_character_dislocation()

func quest_test():
	$SlaveList.update()
	for i in game_party.characters.values():print(i.get_stat('name'), i.get_stat('has_womb'))
	#state.areas.plains.factions.servants.totalreputation = 500
	#print(input_handler.CloseableWindowsArray)
#	for i in state.characters.values():
#		i.base_exp += 100
	#input_handler.add_random_chat_message(state.get_unique_slave('daisy'), 'hire')
	#$Exploration.testcombat()
	#input_handler.emit_signal('EnemyKilled', 'rat')

func _process(delta):
	if self.visible == false:
		return
	$gold.text = custom_text.transform_number(game_res.money)#str(state.money)
	$food.text = custom_text.transform_number(game_res.get_food()) + " - " + str(game_party.get_food_consumption())
	
	$population.text = "Population: "+ str(game_party.characters.size()) +"/" + str(game_res.get_pop_cap())
	#buildscreen()
	update_task_bar()
	if input_handler.globalsettings.turn_based_time_flow == false:
		$TimeNode/HidePanel.visible = gamepaused_nonplayer
		if gamepaused == false:
			for i in get_tree().get_nodes_in_group("pauseprocess"):
				if i.visible == true:
					previouspeed = gamespeed
					changespeed(timebuttons[0], false)
					gamepaused = true
					gamepaused_nonplayer = true
		else:
			var allnodeshidden = true
			for i in get_tree().get_nodes_in_group("pauseprocess"):
				if i.visible == true:
					allnodeshidden = false
					break
			
			
			
			if allnodeshidden == true && gamepaused_nonplayer == true:
				restoreoldspeed(previouspeed)
				gamepaused_nonplayer = false
				gamepaused = false
		
		if gamespeed != 0:
			gametime += delta * gamespeed
			$TimeNode/dayprogress.value = input_handler.calculatepercent(gametime, variables.SecondsPerHour)
			if gametime >= variables.SecondsPerHour:
				gametime -= variables.SecondsPerHour
				advance_hour()

func advance_hour():
	game_globals.hour += 1
	if game_globals.hour >= variables.HoursPerDay:
		advance_day()
	for i in game_party.characters.values():
		i.pretick()
	for i in game_party.characters.values():
		i.act_prepared()
	for i in game_party.characters.values():
		i.tick()
	$TimeNode/Date.text = "Day: " + str(game_globals.date) + ", Hour: " + str(game_globals.hour) + ":00"
	if input_handler.globalsettings.turn_based_time_flow:
		$TimeNode/dayprogress.value = game_globals.hour
	
#	$gold.text = str(state.money)
#	$food.text = str(state.get_food()) + " - " + str(state.get_food_consumption())
	$population.text = "Population: "+ str(game_party.characters.size()) +"/" + str(game_res.get_pop_cap())
	globals.emit_signal("hour_tick")

func advance_day():
	game_party.update_global_cooldowns()
	game_globals.hour = 0
	game_globals.date += 1
	game_globals.daily_interactions_left = 1
	for i in game_party.characters.values():
		i.cooldown_tick()
		i.process_event(variables.TR_DAY)
	for i in game_world.areas.values():
		world_gen.update_guilds(i)
		if int(game_globals.date) % variables.shop_restock_days == 0:
			world_gen.update_area_shop(i)
			for k in i.locations.values():
				if k.has('shop'):
					world_gen.update_area_shop(k)
	world_gen.update_locations()
	globals.autosave()

func set_time_buttons():
	match input_handler.globalsettings.turn_based_time_flow:
		true:
			$"TimeNode/0speed".visible = false
			$"TimeNode/1speed".visible = false
			$"TimeNode/2speed".visible = false
			$TimeNode/finish_turn.visible = true
			$TimeNode/dayprogress.max_value = variables.HoursPerDay
			$TimeNode/dayprogress.value = game_globals.hour
			$TimeNode/HidePanel.hide()
			$TimeNode/turns.show()
			$TimeNode/lessturn.show()
			$TimeNode/moreturn.show()
		false:
			$"TimeNode/0speed".visible = true
			$"TimeNode/1speed".visible = true
			$"TimeNode/2speed".visible = true
			$TimeNode/finish_turn.visible = false
			$TimeNode/dayprogress.max_value = 100
			$TimeNode/turns.hide()
			$TimeNode/lessturn.hide()
			$TimeNode/moreturn.hide()

func changespeed(button, playsound = true):
	if input_handler.globalsettings.turn_based_time_flow == true:
		return
	var oldvalue = gamespeed
	var newvalue = button.get_meta('value')
	for i in timebuttons:
		i.pressed = i == button
	gamespeed = newvalue
	var soundarray = ['time_stop', 'time_start', 'time_up']
	if oldvalue != newvalue && playsound:
		input_handler.PlaySound(soundarray[int(button.name[0])])
	
	gamepaused = newvalue == 0
	input_handler.emit_signal("SpeedChanged", gamespeed)

func restoreoldspeed(value):
	for i in timebuttons:
		if i.get_meta("value") == value:
			changespeed(i, false)

func build_task_bar():
	input_handler.ClearContainer($TaskProgress/ScrollContainer/VBoxContainer)
	
	for i in game_party.active_tasks:
		var newnode = input_handler.DuplicateContainerTemplate($TaskProgress/ScrollContainer/VBoxContainer)
		newnode.get_node("Label").text = races.tasklist[i.code].name
		if i.code in ['alchemy','tailor','cooking','smith','cooking']:
			if game_res.craftinglists[i.code].size() <= 0:
				newnode.hide()
			else:
				newnode.show()
				newnode.get_node("ProgressBar").max_value = game_res.craftinglists[i.code][0].workunits_needed
				newnode.get_node("ProgressBar").value = game_res.craftinglists[i.code][0].workunits
				var recipe = Items.recipes[game_res.craftinglists[i.code][0].code]
				if recipe.resultitemtype == 'material':
					newnode.get_node("icon").texture = Items.materiallist[game_res.craftinglists[i.code][0].code].icon
					newnode.get_node("icon/Label").show()
					newnode.get_node("icon/Label").text = str(game_res.materials[game_res.craftinglists[i.code][0].code])
				else:
					newnode.get_node("icon").texture = Items.itemlist[Items.recipes[game_res.craftinglists[i.code][0].code].resultitem].icon
				if game_res.craftinglists[i.code][0].has('partdict'):
					newnode.get_node('icon').material = load("res://assets/ItemShader.tres")
				else:
					newnode.get_node('icon').material = null
		elif i.product in ['prostitutegold']:
			newnode.get_node("icon").texture = races.tasklist[i.code].production[i.product].icon
			newnode.get_node("ProgressBar").max_value = i.threshhold
			newnode.get_node("ProgressBar").value = i.progress
		elif i.product == 'building':
			if game_res.selected_upgrade.code == '':
				newnode.hide()
			else:
				newnode.show()
				newnode.get_node("icon").texture = races.tasklist[i.code].production[i.product].icon
				newnode.get_node("ProgressBar").max_value = upgradedata.upgradelist[game_res.selected_upgrade.code].levels[game_res.selected_upgrade.level].taskprogress
				newnode.get_node("ProgressBar").value = game_res.upgrade_progresses[game_res.selected_upgrade.code].progress
				
		else:
			newnode.get_node("icon").texture = Items.materiallist[races.tasklist[i.code].production[i.product].item].icon
			newnode.get_node("ProgressBar").max_value = i.threshhold
			newnode.get_node("ProgressBar").value = i.progress
			newnode.get_node("icon/Label").show()
			newnode.get_node("icon/Label").text = str(game_res.materials[races.tasklist[i.code].production[i.product].item])
		newnode.set_meta("dict", i)
		

func update_task_bar():
	for i in $TaskProgress/ScrollContainer/VBoxContainer.get_children():
		if i.has_meta("dict"):
			var task = i.get_meta('dict')
			var text = 'Active workers: '
			for k in task.workers:
				if !game_party.characters.has(k):
					continue
				text += "\n" + game_party.characters[k].name
			globals.connecttexttooltip(i, text)
			if task.code in ['alchemy','tailor','cook','smith','cooking']:
				if game_res.craftinglists[task.code].size() <= 0:
					i.hide()
				else:
					i.show()
					var recipe = Items.recipes[game_res.craftinglists[task.code][0].code]
					i.get_node("ProgressBar").max_value = game_res.craftinglists[task.code][0].workunits_needed
					i.get_node("ProgressBar").value = game_res.craftinglists[task.code][0].workunits
					if recipe.resultitemtype == 'material':
						i.get_node("icon").texture = Items.materiallist[Items.recipes[game_res.craftinglists[task.code][0].code].resultitem].icon
						i.get_node("icon/Label").show()
						i.get_node("icon/Label").text = str(game_res.materials[game_res.craftinglists[task.code][0].code])
					else:
						i.get_node("icon").texture = Items.itemlist[Items.recipes[game_res.craftinglists[task.code][0].code].resultitem].icon
					if game_res.craftinglists[task.code][0].has('partdict'):
						i.get_node('icon').material = load("res://assets/ItemShader.tres").duplicate()
						var itemtemplate = Items.itemlist[game_res.craftinglists[task.code][0].code]
						for k in game_res.craftinglists[task.code][0].partdict:
							var part = 'part' +  str(itemtemplate.partcolororder[k]) + 'color'
							var color = Items.materiallist[game_res.craftinglists[task.code][0].partdict[k]].color
							i.get_node("icon").material.set_shader_param(part, color)
			elif task.code == 'building':
				if game_res.selected_upgrade.code == '':
					i.hide()
				else:
					i.show()
					i.get_node("icon").texture = races.tasklist[task.code].production[task.product].icon
					i.get_node("ProgressBar").max_value = upgradedata.upgradelist[game_res.selected_upgrade.code].levels[int(game_res.selected_upgrade.level)].taskprogress
					i.get_node("ProgressBar").value = game_res.upgrade_progresses[game_res.selected_upgrade.code].progress
			else:
				i.visible = task.workers.size() != 0
				i.get_node("ProgressBar").value = task.progress
				if task.product == 'prostitutegold':
					i.get_node("icon/Label").text = str(game_res.money)
				else:
					i.get_node("icon/Label").text = str(game_res.materials[races.tasklist[task.code].production[task.product].item])
	

func show_task_workers(newnode):
	input_handler.MousePositionScripts.append({nodes = [newnode], targetnode = self, script = 'hide_task_workers'})
	var data = newnode.get_meta("dict")

func hide_task_workers():
	pass

func open_inventory():
	input_handler.get_spec_node(input_handler.NODE_INVENTORY, [{mode = 'all'}])
	#input_handler.ShowInentory({mode = 'all'})

func open_craft():
	$CraftPanel.open()

func open_questlog():
	$QuestPanel.open()

func open_upgrades():
	$UpgradeList.open()
