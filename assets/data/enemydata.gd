extends Node

var predeterminatedgroups = {
	rats_easy = {group = {1 : 'rat', 4 : 'rat',5 : 'rat'}},
} 

var encounters = {
	wolves_skirmish = {unittype = 'randomgroup', unitcode = 'wolves_easy1', bg = 'default', bgm = 'default', win_effects = [{code = 'start_event', data = 'skirmish_complete', args = []}], lose_effects = []},
	rebels_skirmish = {unittype = 'randomgroup', unitcode = 'rebels_small', bg = 'default', bgm = 'default', win_effects = [{code = 'start_event', data = 'skirmish_complete', args = []}], lose_effects = []},
	slavers_small = {unittype = 'randomgroup', unitcode = 'slavers_small', bg = 'default', bgm = 'default', win_effects = [{code = 'start_event', data = 'event_person_acquired', args = []}], lose_effects = []},
	rebels_small = {unittype = 'randomgroup', unitcode = 'rebels_small', bg = 'default', bgm = 'default', win_effects = [{code = 'start_event', data = 'event_person_acquired', args = []}], lose_effects = []},
	goblins_skirmish = {unittype = 'randomgroup', unitcode = 'goblins_skirmish', bg = 'default', bgm = 'default', win_effects = [{code = 'start_event', data = 'skirmish_complete', args = []}], lose_effects = []},
	ogre_skirmish = {unittype = 'randomgroup', unitcode = 'ogre_skirmish', bg = 'default', bgm = 'default', win_effects = [{code = 'start_event', data = 'skirmish_complete', args = []}], lose_effects = []},
	troll_skirmish = {unittype = 'randomgroup', unitcode = 'troll_skirmish', bg = 'default', bgm = 'default', win_effects = [{code = 'start_event', data = 'skirmish_complete', args = []}], lose_effects = []},
	
	
	lich_fight_easy = {unittype = 'randomgroup', unitcode = 'quest_lich_easy', bg = 'default', bgm = 'default', win_effects = [{code = 'start_event', data = 'lich_enc_win', args = []}], lose_effects = []},
	lich_fight_normal = {unittype = 'randomgroup', unitcode = 'quest_lich_normal', bg = 'default', bgm = 'default', win_effects = [{code = 'start_event', data = 'lich_enc_win', args = []}], lose_effects = []},
	
	mimic = {unittype = 'randomgroup', unitcode = 'mimic', bg = 'default', bgm = 'default', win_effects = [], lose_effects = []},
}

var enemygroups = {
	rats_easy = {reqs = [], units = {rat = [2,6]}},
	rats_goblins_easy = {reqs = [], units = {rat = [1,4], cave_goblin_melee = [1,3]}},
	bandits_easy = {reqs = [], units = {bandit_melee = [1,3], trained_dog = [0,2]}},
	bandits_easy2 = {reqs = [], units = {bandit_melee = [1,3], bandit_archer = [1,2]}},
	bandits_easy3 = {reqs = [], units = {trained_dog = [1,2], bandit_archer = [0,3]}},
	
	bandits_easy_boss = {maxunits = 3, reqs = [], units = {bandit_boss = [1,1], bandit_melee = [0,2], bandit_archer = [0,2]}},
	bandits_medium_boss = {maxunits = 6, reqs = [], units = {bandit_boss = [1,1], bandit_melee = [1,2], bandit_archer = [1,2], bandit_mage = [1,1]}},
	
	bandits_assassin = {reqs = [], units = {bandit_melee = [1,2], bandit_assassin = [1,2]}},
	bandits_assassin2 = {reqs = [], units = {bandit_melee = [0,3], bandit_assassin = [0,2], bandit_archer = [0,2]}},
	bandits_medium = {reqs = [], units = {bandit_melee = [2,3], bandit_archer = [2,3]}},
	bandits_medium2 = {reqs = [], units = {bandit_melee = [2,3], bandit_archer = [1,2], bandit_mage = [1,2]}},
	bandits_medium_bear = {reqs = [], units = {trained_bear = [1,2], bandit_archer = [1,2]}},
	bandits_golem = {reqs = [], units = {bandit_melee = [0,2], bandit_archer = [0,2], guardian_golem = [1,1]}},
	
	bandits_raptors = {reqs = [], units = {bandit_melee = [1,2], trained_raptor = [1,2]}},
	bandits_ballista = {reqs = [], units = {bandit_melee = [1,2], ballista = [1,2]}},
	
	goblins_skirmish = {reqs = [], units = {cave_goblin_melee = [2,3], cave_goblin_archer = [2,3], cave_goblin_mage = [0,1]}},
	ogre_skirmish = {reqs = [], units = {cave_goblin_melee = [2,2], ogre_melee = [1,1]}},
	troll_skirmish = {reqs = [], units = {cave_goblin_melee = [1,1], troll = [1,1], cave_goblin_archer = [1,1]}},
	
	goblins_easy = {reqs = [], units = {cave_goblin_melee = [2,3]}},
	goblins_easy2 = {reqs = [], units = {cave_goblin_melee = [1,3], cave_goblin_archer = [1,2]}},
	goblins_easy3 = {reqs = [], units = {cave_goblin_melee = [1,2], cave_goblin_archer = [1,3]}},
	goblins_easy_boss = {maxunits = 3, reqs = [], units = {cave_goblin_boss = [1,1], cave_goblin_melee = [0,2], cave_goblin_archer = [0,2]}},
	grove_easy_boss = {maxunits = 5, reqs = [], units = {troll = [1,1], wolf = [2,4]}},
	ogre_med1 = {reqs = [], units = {ogre_melee = [1,1], cave_goblin_melee = [0,1], cave_goblin_archer = [0,1]}},
	ogre_med2 = {reqs = [], units = {ogre_melee = [0,1], ogre_mage = [1,1]}},
	troll_boss = {maxunits = 4, reqs = [], units = {cave_goblin_boss = [1,1], cave_goblin_melee = [0,2]}},
	
	wolves_easy1 = {reqs = [], units = {wolf = [4,6]}},
	wolves_easy2 = {reqs = [], units = {wolf = [3,5]}},
	
	slavers_small = {reqs = [], units = {bandit_melee = [2,3]}},
	rebels_small = {reqs = [], units = {rebel_recruit = [3,4]}},
	spiders = {reqs = [], units = {spider = [2,3]}},
	spiders_many = {reqs = [], units = {spider = [4,6]}},
	
	rats = {reqs = [], units = {rat = [3,5]}},
	
	skeletons_easy = {reqs = [], units = {skeleton_melee = [2,3]}},
	skeletons_easy2 = {reqs = [], units = {skeleton_melee = [1,2], skeleton_archer = [1,2]}},
	skeletons_zombies = {reqs = [], units = {skeleton_melee = [1,2], zombie = [1,2]}},
	skeletons_zombies2 = {reqs = [], units = {skeleton_archer = [1,2], zombie = [2,3]}},
	skeletons_lich = {reqs = [], units = {skeleton_melee = [2,3], skeleton_archer = [1,2], undead_lich = [1,1]}},
	skeletons_lich_boss = {maxunits = 6, reqs = [], units = {undead_lich = [1,1], skeleton_archer = [2,2], zombie = [3,3]}},
	
	
	quest_lich_easy = {reqs = [], units = {lich_quest = [1,1], zombie = [1,1], skeleton_archer = [1,1]}},
	quest_lich_normal = {reqs = [], units = {lich_quest = [1,1], zombie = [2,2], skeleton_archer = [2,2]}},
	
	mimic = {reqs = [], units = {mimic = [1,1]}},
}

#Ai patterns: basic - basic attack/ranged attack or pass (if exist), ads - advanced single target skill, aoe - aoe skill, buff - buffing skill
#ai_hard is selected when difficulty set to hard mode (if exists)
var enemies = {
	bandit_melee = {
		code = 'bandit_melee',
		name = '',
		descript = '',
		hpmax = 75,
		armor = 15,
		mdef = 0,
		hitrate = 85,
		evasion = 10,
		armorpenetration = 0,
		atk = 15,
		matk = 5,
		speed = 35,
		resists = {dark = 25, fire = 25, earth = -50, water = -50},
		status_resists = {},
		race = 'humanoid',
		loot = 'bandit_loot',
		icon = "res://assets/images/enemies/banditleaderm.png",
		body = null,
		skills = ['attack', 'earth_atk'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 66], ['ads', 33]],
		ai_hard = [['basic', 50], ['ads', 50]],
		ai_position = ['melee'],
		xpreward = 20,
	},
	bandit_archer = {
		code = 'bandit_archer',
		name = '',
		descript = '',
		hpmax = 70,
		armor = 5,
		mdef = 0,
		hitrate = 95,
		evasion = 0,
		armorpenetration = 0,
		atk = 20,
		matk = 5,
		speed = 40,
		resists = {fire = 25, air = 25, earth = -50, light = -50, water = 50},
		race = 'humanoid',
		loot = 'bandit_loot',
		icon = "res://assets/images/enemies/banditm.png",
		body = null,
		skills = ['wind_atk','ranged_attack'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 66], ['ads', 33]],
		ai_position = ['ranged'],
		xpreward = 20,
	},
	bandit_assassin = {
		code = 'bandit_assassin',
		name = '',
		descript = '',
		hpmax = 120,
		armor = 10,
		mdef = 5,
		hitrate = 95,
		evasion = 0,
		armorpenetration = 10,
		atk = 35,
		matk = 10,
		speed = 50,
		resists = {dark = 75, light = -75, fire = 25, earth = -50, air = 50, water = -25, mind = 25},
		race = 'humanoid',
		loot = 'assassin_loot',
		icon = "res://assets/images/enemies/banditf.png",
		body = null,
		skills = ['ranged_attack', 'assassinate'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai =  [['basic', 66], ['ads', 33]],
		ai_position = ['ranged'],
		xpreward = 25,
	},
	bandit_boss = {
		code = 'bandit_boss',
		name = '',
		descript = '',
		hpmax = 220,
		armor = 10,
		mdef = 10,
		hitrate = 85,
		evasion = 15,
		armorpenetration = 0,
		atk = 20,
		matk = 15,
		speed = 35,
		resists = {dark = 50, fire = 50, earth = -50, water = -50, light = -25},
		status_resists = {stun = 25},
		race = 'humanoid',
		loot = 'bandit_loot',
		icon = "res://assets/images/enemies/banditleaderm.png",
		body = null,
		skills = ['attack', 'slash'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 85], ['aoe', 15]],
		ai_hard = [['basic', 85], ['aoe', 50]],
		ai_position = ['melee'],
		xpreward = 50,
	},
	rebel_recruit = {
		code = 'rebel_recruit',
		name = '',
		descript = '',
		hpmax = 60,
		armor = 5,
		mdef = 5,
		hitrate = 85,
		evasion = 10,
		armorpenetration = 0,
		atk = 12,
		matk = 5,
		speed = 35,
		resists = {light = 25, fire = 25, air = -50, water = -50},
		status_resists = {},
		race = 'humanoid',
		loot = 'bandit_loot',
		icon = "res://assets/images/enemies/banditm.png",
		body = null,
		skills = ['attack'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 66], ['ads', 33]],
		ai_hard = [['basic', 50], ['ads', 50]],
		ai_position = ['melee'],
		xpreward = 20,
	},
	rebel_knight = {
		code = 'rebel_knight',
		name = '',
		descript = '',
		hpmax = 120,
		armor = 25,
		mdef = 0,
		hitrate = 95,
		evasion = 0,
		armorpenetration = 0,
		atk = 20,
		matk = 3,
		speed = 40,
		resists = {light = 50, fire = 50, air = -50, water = -50, dark = -50},
		status_resists = {},
		race = 'humanoid',
		loot = 'bandit_loot',
		icon = "res://assets/images/enemies/humanguard.png",
		body = null,
		skills = ['attack'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 75], ['aoe', 25]],
		ai_hard = [['basic', 50], ['aoe', 50]],
		ai_position = ['melee','fire_cleave'],
		xpreward = 20,
	},
	rebel_mage = {
		code = 'rebel_mage',
		name = '',
		descript = '',
		hpmax = 100,
		armor = 5,
		mdef = 20,
		hitrate = 80,
		evasion = 10,
		armorpenetration = 0,
		atk = 5,
		matk = 20,
		speed = 30,
		resists = {fire = 50, air = 50, earth = -50, water = 50, light = -50},
		race = 'humanoid',
		loot = 'bandit_loot',
		icon = "res://assets/images/enemies/stranger.png",
		body = null,
		skills = ['firearr','ranged_attack','blizzard'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['aoe', 33], ['ads', 66]],
		ai_position = ['ranged'],
		xpreward = 25,
	},
	rebel_healer = {
		code = 'rebel_healer',
		name = '',
		descript = '',
		hpmax = 85,
		armor = 15,
		mdef = 15,
		hitrate = 90,
		evasion = 10,
		armorpenetration = 0,
		atk = 10,
		matk = 15,
		speed = 30,
		resists = {fire = -50, air = 50, earth = -50, water = 50, dark = -50},
		race = 'humanoid',
		loot = 'bandit_loot',
		icon = "res://assets/images/enemies/stranger.png",
		body = null,
		skills = ['lesser_heal','attack'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 33], ['heal', 66]],
		ai_position = ['ranged'],
		xpreward = 25,
	},
	
	trained_dog = {
		code = 'trained_dog',
		name = '',
		descript = '',
		hpmax = 50,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 25,
		armorpenetration = 0,
		atk = 20,
		matk = 0,
		speed = 45,
		resists = {air = 25, fire = -50, water = -25, earth = 10},
		race = 'beast',
		loot = 'dog_loot',
		icon = "res://assets/images/enemies/wolf.png",
		body = null,
		skills = ['attack'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 100],['ads', 0]],
		ai_position = ['melee'],
		xpreward = 15,
	},
	trained_bear = {
		code = 'trained_bear',
		name = '',
		descript = '',
		hpmax = 150,
		armor = 25,
		mdef = 10,
		hitrate = 90,
		evasion = 0,
		armorpenetration = 0,
		atk = 40,
		matk = 0,
		speed = 30,
		resists = {earth = 50, water = 25, fire = -50, mind = -25},
		race = 'beast',
		loot = 'bear_loot',
		icon = "res://assets/images/enemies/bear.png",
		body = null,
		skills = ['attack'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 100],['ads', 0]],
		ai_position = ['melee'],
		xpreward = 25,
	},
	trained_raptor = {
		code = 'trained_raptor',
		name = '',
		descript = '',
		hpmax = 95,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 30,
		armorpenetration = 0,
		atk = 40,
		matk = 0,
		speed = 50,
		resists = {air = 50, fire = 50, water = -50, earth = -25},
		race = 'beast',
		loot = 'raptor_loot',
		icon = "res://assets/images/enemies/wyvern.png",
		body = null,
		skills = ['bleeding_strike'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 50],['ads', 50]],
		ai_position = ['melee'],
		xpreward = 35,
	},
	guardian_golem = {
		code = 'guardian_golem',
		name = '',
		descript = '',
		hpmax = 175,
		armor = 45,
		mdef = 0,
		hitrate = 80,
		evasion = 0,
		armorpenetration = 0,
		atk = 50,
		matk = 15,
		speed = 30,
		resists = {earth = 75, fire = 50, air = 50, water = -25, mind = -50, dark = -50},
		status_resists = {stun = 100, bleed = 100, poison = 100},
		race = 'golem',
		loot = 'guardian_golem_loot',
		icon = "res://assets/images/enemies/GolemAltIcon.png",
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 100],['ads', 0]],
		ai_position = ['melee'],
		xpreward = 40,
	},
	ballista = {
		code = 'ballista',
		name = '',
		descript = '',
		hpmax = 200,
		armor = 25,
		mdef = 10,
		hitrate = 90,
		evasion = 0,
		armorpenetration = 0,
		atk = 35,
		matk = 5,
		speed = 25,
		resists = {fire = -100, air = 100, mind = 100, earth = 50, water = 25},
		status_resists = {stun = 100, bleed = 100, poison = 100},
		race = 'mech',
		loot = 'ballista_loot',
		icon = null,
		body = null,
		skills = ['attack'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 50],['ads', 50]],
		ai_position = ['ranged'],
		xpreward = 30,
	},
	bandit_mage = {
		code = 'bandit_mage',
		name = '',
		descript = '',
		hpmax = 60,
		armor = 0,
		mdef = 10,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		atk = 10,
		matk = 18,
		speed = 30,
		resists = {water = 50, fire = -50, air = 50, earth = -50},
		race = 'humanoid',
		loot = 'bandit_loot',
		icon = null,
		body = null,
		skills = ['firearr', 'mindblast'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['ads', 45], ['aoe', 45], ['support', 10]], #add healing on self when hp < 50 with 75% chance
		ai_position = ['ranged'],
		xpreward = 30,
	},
	cave_goblin_melee = {
		code = 'cave_goblin_melee',
		name = '',
		descript = '',
		hpmax = 55,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 25,
		armorpenetration = 0,
		atk = 10,
		matk = 5,
		speed = 30,
		resists = {water = 50, earth = -25, fire = -25, mind = -50},
		race = 'humanoid',
		loot = 'goblin_loot',
		icon = "res://assets/images/enemies/goblin.png",
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 66], ['ads', 33]],
		ai_position = ['melee'],
		xpreward = 15,
	},
	cave_goblin_archer = {
		code = 'cave_goblin_archer',
		name = '',
		descript = '',
		hpmax = 50,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 20,
		armorpenetration = 0,
		atk = 14,
		matk = 5,
		speed = 35,
		resists = {water = -50, fire = -25, mind = -50},
		race = 'humanoid',
		loot = 'goblin_loot',
		icon = "res://assets/images/enemies/goblin.png",
		body = null,
		skills = ['ranged_attack'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 100]],
		ai_position = ['ranged'],
		xpreward = 15,
	},
	cave_goblin_mage = {
		code = 'cave_goblin_mage',
		name = '',
		descript = '',
		hpmax = 45,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 25,
		armorpenetration = 0,
		atk = 10,
		matk = 15,
		speed = 25,
		resists = {earth = 25, water = -50, fire = 25, mind = -25},
		traits = [],
		race = 'humanoid',
		loot = 'goblin_loot',
		icon = "res://assets/images/enemies/goblin.png",
		body = null,
		skills = ['firearr'],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['ads', 100]],
		ai_position = ['ranged'],
		xpreward = 20,
	},
	cave_goblin_boss = {
		code = 'cave_goblin_boss',
		name = '',
		descript = '',
		hpmax = 150,
		armor = 15,
		mdef = 20,
		hitrate = 85,
		evasion = 10,
		armorpenetration = 0,
		atk = 20,
		matk = 5,
		speed = 40,
		resists = {earth = 25, water = 25, fire = -25, mind = -25},
		race = 'humanoid',
		loot = 'goblin_loot',
		icon = "res://assets/images/enemies/goblin.png",
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 66], ['ads', 33]],
		ai_position = ['melee'],
		xpreward = 25,
	},
	ogre_melee = {
		code = 'ogre_melee',
		name = '',
		descript = '',
		hpmax = 200,
		armor = 60,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		atk = 40,
		matk = 10,
		speed = 35,
		resists = {fire = 50, earth = 50, water = 50, air = -50, mind = -50},
		race = 'humanoid',
		loot = 'ogre_loot',
		icon = null,
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 66], ['ads', 33]],
		ai_position = ['melee'],
		xpreward = 50,
	},
	ogre_mage = {
		code = 'ogre_mage',
		name = '',
		descript = '',
		hpmax = 175,
		armor = 30,
		mdef = 30,
		hitrate = 80,
		evasion = 0,
		armorpenetration = 0,
		atk = 30,
		matk = 20,
		speed = 25,
		resists = {fire = 100, earth = 50, water = -50, air = -50, dark = 50, mind = -50},
		race = 'humanoid',
		loot = 'ogre_loot',
		icon = null,
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 66], ['ads', 33]],
		ai_position = ['ranged'],
		xpreward = 55,
	},
	troll = {
		code = 'troll',
		name = '',
		descript = '',
		hpmax = 350,
		armor = 20,
		mdef = 20,
		hitrate = 100,
		evasion = 10,
		armorpenetration = 15,
		atk = 60,
		matk = 5,
		speed = 40,
		resists = {fire = -50, water = 75, air = 50, dark = 50, light = -50, mind = -25},
		race = 'humanoid',
		loot = 'troll_loot',
		icon = "res://assets/images/enemies/mutant.png",
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 66], ['ads', 33]],
		ai_position = ['melee'],
		xpreward = 80,
	},
	skeleton_melee = {
		code = 'skeleton_melee',
		name = '',
		descript = '',
		hpmax = 100,
		armor = 15,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		atk = 25,
		matk = 5,
		speed = 35,
		resists = {air = 50, water = 25, dark = 50, fire = -25, light = -50, mind = 75},
		status_resists = {bleed = 1000},
		race = 'undead',
		loot = 'skeleton_melee_loot',
		icon = "res://assets/images/enemies/undead_warrior_portrait.png",
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 66], ['ads', 33]],
		ai_position = ['melee'],
		xpreward = 20,
	},
	skeleton_archer = {
		code = 'skeleton_archer',
		name = '',
		descript = '',
		hpmax = 90,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		atk = 20,
		matk = 5,
		speed = 45,
		resists = {air = 25, water = 25, dark = 50, fire = 25, light = -50, mind = 75},
		status_resists = {bleed = 1000},
		race = 'undead',
		loot = 'skeleton_archer_loot',
		icon = "res://assets/images/enemies/Undead_archer_portrait.png",
		body = null,
		skills = ['ranged_attack'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 66], ['ads', 33]],
		ai_position = ['ranged'],
		xpreward = 20,
	},
	zombie = {
		code = 'zombie',
		name = '',
		descript = '',
		hpmax = 120,
		armor = 15,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		atk = 20,
		matk = 5,
		speed = 20,
		resists = {earth = 25, fire = -50, dark = 25, light = -50, mind = 50},
		race = 'undead',
		loot = 'zombie_loot',
		icon = "res://assets/images/enemies/zombie_portrait.png",
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 66], ['ads', 33]],
		ai_position = ['melee'],
		xpreward = 20,
	},
	undead_lich = {
		code = 'undead_lich',
		name = '',
		descript = '',
		hpmax = 150,
		armor = 5,
		mdef = 30,
		hitrate = 90,
		evasion = 0,
		armorpenetration = 0,
		atk = 10,
		matk = 35,
		speed = 30,
		resists = {earth = 50, water = 50, dark = 75, light = -100, fire = -50},
		status_resists = {bleed = 1000},
		race = 'undead',
		loot = 'lich_loot',
		icon = "res://assets/images/enemies/undead_warrior_portrait.png",
		body = null,
		skills = ['decay'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['aoe', 33], ['ads', 66]],
		ai_hard = [['basic', 50], ['ads', 50]],
		ai_position = ['ranged'],
		xpreward = 50,
	},
	lich_quest = {
		code = 'lich_quest',
		name = '',
		descript = '',
		hpmax = 250,
		armor = 10,
		mdef = 30,
		hitrate = 90,
		evasion = 10,
		armorpenetration = 0,
		atk = 20,
		matk = 35,
		speed = 40,
		resists = {earth = 50, water = 50, dark = 75, light = -100, fire = -50},
		status_resists = {bleed = 1000},
		race = 'undead',
		loot = 'quest_lich_loot',
		icon = "res://assets/images/enemies/undead_warrior_portrait.png",
		body = null,
		skills = ['decay'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['aoe', 33], ['ads', 66]],
		ai_hard = [['basic', 50], ['ads', 50]],
		ai_position = ['ranged'],
		xpreward = 50,
	},
	wolf = {
		code = 'wolf',
		name = '',
		descript = '',
		hpmax = 50,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		atk = 15,
		matk = 2,
		speed = 30,
		resists = {fire = -50},
		race = 'beast',
		loot = 'wolf_loot',
		icon = "res://assets/images/enemies/wolf.png",
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 100]],
		ai_position = ['melee'],
		xpreward = 10,
	},
	spider = {
		code = 'spider',
		name = '',
		descript = '',
		hpmax = 75,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		atk = 15,
		matk = 6,
		speed = 30,
		resists = {earth = 50, air = 50, fire = -25},
		race = 'beast',
		loot = 'spider_loot',
		icon = "res://assets/images/enemies/SpiderIcon.png",
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 100]],
		ai_position = ['melee'],
		xpreward = 15,
	},
	rat = {
		code = 'rat',
		name = '',
		descript = '',
		hpmax = 30,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		atk = 12,
		matk = 1,
		speed = 30,
		resists = {fire = -50, mind = -25},
		race = 'beast',
		loot = 'rat_loot',
		icon = "res://assets/images/enemies/RatIcon.png",
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 100]],
		ai_position = ['melee'],
		xpreward = 10,
	},
	gryphon = {
		code = 'gryphon',
		name = '',
		descript = '',
		hpmax = 300,
		armor = 25,
		mdef = 50,
		hitrate = 120,
		evasion = 40,
		armorpenetration = 0,
		atk = 90,
		matk = 30,
		speed = 50,
		resists = {air = 100, water = 35, fire = -50},
		race = 'beast',
		loot = 'gryphon_loot',
		icon = null,
		body = null,
		skills = [],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 100]],
		ai_position = ['melee'],
		xpreward = 100,
	},
	
	mimic = {
		code = 'mimic',
		name = '',
		descript = '',
		hpmax = 200,
		armor = 50,
		mdef = 75,
		hitrate = 120,
		evasion = 10,
		armorpenetration = 25,
		atk = 80,
		matk = 20,
		speed = 40,
		resists = {earth = 50, water = 100, fire = -25, mind = 50, dark = 50, light = -50},
		status_resists = {stun = 100, bleed = 100, poison = 100},
		race = 'monster',
		loot = 'mimic_loot',
		icon = 'res://assets/images/gui/panels/chest.png',
		body = null,
		skills = ['mimic_attack'],
		traits = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = [['basic', 50], ['ads', 50]],
		ai_position = ['melee'],
		xpreward = 100,
	},
}

var loot_variants_data = {
	easy_chest_usable = [
	{code = 'material', min = 2, max = 5, grade = ['easy', 'medium']}, 
	{code = 'material', min = 2, max = 5, grade = ['location']}, 
	{code = 'usable', min = 2, max = 4, grade = ['easy']}, 
	],
	easy_chest_gear = [
	{code = 'material', min = 2, max = 3, grade = ['location']}, 
	{code = 'gear', min = 1, max = 1, grade = ['easy'], material_grade = [['easy',10], ['medium', 3]]},
	],
	easy_chest_cosmetics = [
	{code = 'material', min = 2, max = 4, grade = ['location']}, 
	{code = 'static_gear', min = 1, max = 1, grade = ['easy']}
	],
	
	
	medium_chest_usable = [
	{code = 'material', min = 2, max = 3, grade = ['medium','hard']}, 
	{code = 'material', min = 2, max = 3, grade = ['location']}, 
	{code = 'usable', min = 2, max = 4, grade = ['easy','medium']}, 
	{code = 'usable', min = 0, max = 1, grade = ['easy','medium']}, 
	],
	medium_chest_gear = [
	{code = 'material', min = 2, max = 4, grade = ['location']}, 
	{code = 'gear', min = 1, max = 1, grade = ['easy'], material_grade = [['easy',3], ['medium', 10], ['hard',1]]},
	],
	medium_chest_cosmetics = [
	{code = 'material', min = 2, max = 4, grade = ['location']}, 
	{code = 'static_gear', min = 1, max = 1, grade = ['easy','medium']}
	],
	
	easy_armory_weapon = [
		{code = 'weapon', min = 1, max = 1, grade = ['easy'], material_grade = [['easy',10], ['medium', 3], ['hard',1]]},
	],
	easy_armory_armor = [
		{code = 'armor', min = 1, max = 1, grade = ['easy'], material_grade = [['easy',10], ['medium', 3], ['hard',1]]},
	],
	
	medium_armory_weapon = [
		{code = 'weapon', min = 1, max = 1, grade = ['easy'], material_grade = [['easy',2], ['medium', 10], ['hard',3]]},
	],
	medium_armory_armor = [
		{code = 'armor', min = 1, max = 1, grade = ['easy'], material_grade = [['easy',2], ['medium', 10], ['hard',3]]},
	],
	
	easy_prisoner_reward_item = [
	{code = 'gear', min = 1, max = 1, grade = ['easy'], material_grade = [['easy',10], ['medium', 5]]},
	],
	easy_prisoner_reward_resource = [
	{code = 'material', min = 5, max = 10, grade = ['easy']}, 
	{code = 'material', min = 3, max = 6, grade = ['location']},
	],
	easy_boss_chest = [
	{code = 'static_gear', min = 1, max = 1, grade = ['easy']},
	{code = 'gear', min = 1, max = 2, grade = ['easy'], material_grade = [['easy',10], ['medium', 4]]},
	{code = 'defined', name = 'exp_scroll', min = 1, max = 2}, 
	],
	
	grove_wood_reward = [
		{code = 'material_selected', options = [['wood',1],['woodiron',1],['woodmagic',0.7],['woodancient',0.2]], value = [100,200]}
	],
	grove_leather_reward = [
		{code = 'material_selected', options = [['leather',1],['leatherthick',1],['leathermythic',0.7],['leatherdragon',0.1]], value = [100,200]}
	],
	crypt_bone_reward = [
		{code = 'material_selected', options = [['bone',1],['boneancient',0.5],['bonedragon',0.1]], value = [100,200]}
	],
	
	
	test_chest_mimic = [],
	
	fighters_join_reward = [
	{code = 'defined', name = 'sword', min = 1, max = 1, parts = {WeaponHandle = 'wood', Blade = 'iron'}},
	{code = 'defined', name = 'chest_base_leather', min = 1, max = 1, parts = {ArmorBaseMed = 'leather', ArmorTrim = 'wood'}},
	],
	workers_join_reward = [
	{code = 'defined', name = 'axe', min = 1, max = 1, parts = {ToolHandle = 'wood', ToolBlade = 'iron'}},
	{code = 'defined', name = 'worker_outfit', min = 1, max = 1},
	],
	servants_join_reward = [
	{code = 'defined', name = 'elegant_choker', min = 1, max = 1},
	{code = 'defined', name = 'maid_dress', min = 1, max = 1},
	{code = 'defined', name = 'beer', min = 4, max = 4}
	],
	mages_join_reward = [
	{code = 'defined', name = 'staff', min = 1, max = 1, parts = {WeaponHandle = 'wood', Rod = 'woodmagic'}},
	{code = 'defined', name = 'lifeshard', min = 3, max = 3},
	{code = 'defined', name = 'energyshard', min = 2, max = 2},
	],
	servants_election_bonus = [
		{code = 'defined', name = 'amulet_of_recognition', min = 1, max = 1},
	],
	fighters_lich_bonus_loot = [
		{code = 'defined', name = 'energyshard', min = 3, max = 4},
		{code = 'defined', name = 'lifegem', min = 3, max = 4},
		{code = 'defined', name = 'boneancient', min = 5, max = 5},
	],
	aliron_church_bonus = [
		{code = 'defined', name = 'lifeshard', min = 5, max = 5},
	],
	
	celena_reward = [
		{code = 'defined', name = 'lifeshard', min = 3, max = 5},
	],
	celena_reward2 = [
		{code = 'defined', name = 'lifegem', min = 2, max = 3},
	],
	celena_destroy_shrine1 = [
		{code = 'defined', name = 'iron', min = 5, max = 10},
		{code = 'defined', name = 'steel', min = 2, max = 4},
	],
	celena_destroy_shrine2 = [
		{code = 'defined', name = 'steel', min = 3, max = 5},
		{code = 'defined', name = 'mithril', min = 1, max = 3},
	],
	erebus_reward = [
		{code = 'defined', name = 'energyshard', min = 3, max = 5},
	],
	erebus_reward2 = [
		{code = 'defined', name = 'energygem', min = 2, max = 3},
	],
	erebus_destroy_shrine = [
		{code = 'defined', name = 'stone', min = 20, max = 40},
		{code = 'defined', name = 'obsidian', min = 1, max = 4},
	],
	freya_destroy_shrine = [
		{code = 'defined', name = 'wood', min = 5, max = 30},
		{code = 'defined', name = 'woodmagic', min = 2, max = 10},
		{code = 'defined', name = 'woodancient', min = 0, max = 1},
	],
}


var locks_data = { #makes locks to lockpick for related chests
	easy_chest_usable = {locks = [['normal', 1],['none', 0.5],['mimic',0.1],['mimic_erotic',0.1]], difficulty = [5,20]},
	easy_chest_gear = {locks = [['normal', 1],['mimic',0.1],['mimic_erotic',0.1]], difficulty = [10,25]},
	easy_chest_cosmetics = {locks = [['normal', 1],['none', 0.2],['mimic',0.1],['mimic_erotic',0.1]], difficulty = [5,20]},
	easy_boss_chest = {locks = [['normal', 1]], difficulty = [10,25]},
	
	easy_armory_weapon = {locks = [['normal', 1], ['alarm', 1]], difficulty = [15,25]},
	easy_armory_armor = {locks = [['normal', 1], ['alarm', 1]], difficulty = [15,25]},
	
	medium_armory_weapon = {locks = [['normal', 1], ['alarm', 1]], difficulty = [30,60]},
	medium_armory_armor = {locks = [['normal', 1], ['alarm', 1]], difficulty = [30,60]},
	
	medium_chest_usable = {locks = [['normal', 1],['none', 0.5],['bomb',1],['gas',1],['mimic',0.3],['mimic_erotic',0.3]], difficulty = [15,40]},
	medium_chest_gear = {locks = [['normal', 1],['mimic',0.2],['mimic_erotic',0.2]], difficulty = [25,55]},
	medium_chest_cosmetics = {locks = [['normal', 1],['none', 0.2],['mimic',0.2],['mimic_erotic',0.2]], difficulty = [20,50]},
	medium_boss_chest = {locks = [['normal', 1]], difficulty = [20,55]},
	
	test_chest_mimic = {locks = [['mimic', 1]], difficulty = [100,100]},
	}


var loottables = {
	rat_loot = [['leather', 0.1], ['lifeshard', 0.1]],
	spider_loot = [['clothsilk', 0.5, 2],['lifeshard', 0.2]],
	bandit_loot = [['cloth', 0.5, 2], ['lifeshard', 0.2], ['energyshard', 0.05], ['gold', 1, 3]],
	bandit_boss_loot = [['clothsilk', 0.8, 4], ['lifeshard', 0.3], ['gold', 15, 30]],
	wolf_loot = [['leather', 0.5, 2], ['bone', 0.2]],
	gryphon_loot = [['leathermythic', 1, 5], ['leathermythic', 0.5, 3]],
	goblin_loot = [['stone', 0.2, 1], ['gold', 0, 2]],
	bear_loot = [['leatherthick', 0.5, 3]],
	dog_loot = [['leather', 0.5, 2]],
	ballista_loot = [['woodiron', 0.5, 3], ['wood', 0.25, 5]],
	assassin_loot = [['gold', 10, 20],['energyshard', 0.5]],
	guardian_golem_loot = [['stone',0.9,5]],
	troll_loot = [],
	ogre_loot = [],
	raptor_loot = [['leatherthick', 0.7, 2]],
	skeleton_melee_loot = [['bone', 0.5, 3],['lifeshard', 0.2]],
	skeleton_archer_loot = [['bone', 0.5, 2]],
	quest_lich_loot = [['boneancient', 0.5, 2], ['lich_skull', 1], ['energygem', 0.5]],
	lich_loot = [['boneancient', 0.5, 2], ['energygem', 0.5]],
	zombie_loot = [['cloth', 0.5, 2], ['gold',1, 3]],
	mimic_loot = [['woodiron', 0.8, 5], ['lifegem', 0.75, 3], ['gold', 20, 30]],
}


var shrines = {
	celena = {
		options = {
			"material" : {input = 'material', output = 'celena_item'},
			"character" : {input = 'character', output = 'celena_character'},
			"destroy" : {input = 'destroy', output = 'celena_destroy'}
		},
		bless = 'celena_bless',
		curse = 'celena_curse',
	},
	erebus = {
		options = {
			"material" : {input = 'material', output = 'erebus_item'},
			#"character" : {input = 'character', output = 'erebus_character'},
			"destroy" : {input = 'destroy', output = 'erebus_destroy'}
		},
		bless = '',
		curse = '',
	},
	freya = {
		options = {
			"material" : {input = 'material', output = 'freya_item'},
			"character" : {input = 'character', output = 'freya_character'},
			"destroy" : {input = 'destroy', output = 'freya_destroy'}
		},
		bless = 'freya_bless',
		curse = 'freya_curse',
	
	},
}


func celena_item(code):
	var dict = {text = '[name] puts an offer on the altar. ', image = '', options = [], tags = ['active_character_translate']}
	var item = Items.materiallist[code]
	globals.common_effects([{code = 'material_change', operant = '-', material = code, value = 1}])
	
	if item.type in ['wood','plant','food']:
		dict.text += "\n\n{color=green|The offering disappars in a thin air and after a moment a new item materialize in place. It seems your offer was correct and you are rewarded.}"
		
		dict.common_effects = [{code = 'make_loot', type = 'tableloot', pool = [['celena_reward',2], ['celena_reward2',1]]}]
		dict.tags.append("free_loot")
	else:
		dict.text += "\n\nThe offering disappers from sight but there's no other changes around. It seems your offer wasn't liked."
		dict.options.append({code = 'close', reqs = [], text = "DIALOGUELEAVE"})
	
	
	input_handler.interactive_message_follow(dict, 'direct', [])

func celena_character(person):
	
	var dict = {text = '[name] puts [his] hand on the altar. ', image = '', options = [], tags = ['active_character_translate'], common_effects = []}
	
	if randf() <= 0.5:
		dict.text += "\n\n{color=green|A small glow emits from the altar and enshrouds [name]. It seems [he] has been blessed...}"
		
		dict.common_effects.append({code = 'affect_active_character', type = 'effect', value = 'celena_bless'})
	else:
		dict.text += "\n\nAfter a few minutes nothing still happened and [name] decides to move on."
	
	dict.options.append({code = 'close', reqs = [], text = "DIALOGUELEAVE"})
	
	
	input_handler.interactive_message_follow(dict, 'direct', [])

func celena_destroy(person):
	
	var dict = {text = '[name] demolishes the shrine and gathers the resources. ', image = '', options = [], tags = ['active_character_translate'], common_effects = []}
	
	if randf() <= 0.33:
		dict.text += "\n\n{color=red|An eerie glow emits from the remnants of an altar and enshrouds [name]. It seems [he] has been cursed...}"
		
		dict.common_effects.append({code = 'affect_active_character', type = 'effect', value = 'celena_curse'})
	
	dict.common_effects.append({code = 'make_loot', type = 'tableloot', pool = [['celena_destroy_shrine1',3], ['celena_destroy_shrine2',1]]})
	dict.tags.append("free_loot")
	
	
	input_handler.interactive_message_follow(dict, 'direct', [])

func freya_item(code):
	var dict = {text = '[name] puts an offer on the altar. ', image = '', options = [], tags = ['active_character_translate']}
	var item = Items.materiallist[code]
	globals.common_effects([{code = 'material_change', operant = '-', material = code, value = 1}])
	
	if item.type in ['cloth']:
		dict.text += "\n\n{color=green|The offering disappars in a thin air and a bright light surrounds [name]. It seems the offer was correct and [he] received a blessing.}"
		dict.common_effects.append({code = 'affect_active_character', type = 'effect', value = 'freya_bless'})
	elif item.type in ['wood']:
		dict.text += "\n\n{color=red|The offering disappers from sight but an eerie glow erupts from the altar. It seems [name] as been cursed...}"
		dict.common_effects.append({code = 'affect_active_character', type = 'effect', value = 'freya_curse'})
	else:
		dict.text += "\n\nThe offering disappers from sight but there's no other changes around. It seems your offer wasn't liked."
	
	dict.options.append({code = 'close', reqs = [], text = "DIALOGUELEAVE"})
	
	input_handler.interactive_message_follow(dict, 'direct', [])

func freya_character(person):
	
	var dict = {text = '[name] puts [his] hand on the altar. ', image = '', options = [], tags = ['active_character_translate'], common_effects = []}
	
	
	
	if person.checkreqs([{code = 'has_wooden_gear'}]):
		dict.text += "\n\n{color=red|An eerie glow emits from the remnants of an altar and enshrouds [name]. It seems [he] has been cursed...}"
		dict.common_effects.append({code = 'affect_active_character', type = 'effect', value = 'freya_curse'})
	else:
		if randf() >= 0.5 || person.get_stat('race') in ['Elf','DarkElf','TribalElf','Fairy','Dryad']:
			dict.text += "\n\n{color=green|A small glow emits from the altar and enshrouds [name]. It seems [he] has been blessed...}"
			
			dict.common_effects.append({code = 'affect_active_character', type = 'effect', value = 'freya_bless'})
		else:
			dict.text += "\n\nAfter a few minutes nothing still happened and [name] decides to move on."
	
	dict.options.append({code = 'close', reqs = [], text = "DIALOGUELEAVE"})
	
	
	input_handler.interactive_message_follow(dict, 'direct', [])

func freya_destroy(person):
	
	var dict = {text = '[name] demolishes the shrine and gathers the resources. ', image = '', options = [], tags = ['active_character_translate'], common_effects = []}
	
	if randf() <= 0.75:
		dict.text += "\n\n{color=red|An eerie glow emits from the remnants of an altar and enshrouds [name]. It seems [he] has been cursed...}"
		
		dict.common_effects.append({code = 'affect_active_character', type = 'effect', value = 'freya_curse'})
	
	dict.common_effects.append({code = 'make_loot', type = 'tableloot', pool = [['freya_destroy_shrine',1]]})
	dict.tags.append("free_loot")
	
	
	input_handler.interactive_message_follow(dict, 'direct', [])


func erebus_item(code):
	var dict = {text = '[name] puts an offer on the altar. ', image = '', options = [], tags = ['active_character_translate']}
	var item = Items.materiallist[code]
	globals.common_effects([{code = 'material_change', operant = '-', material = code, value = 1}])
	
	if item.type in ['stone']:
		dict.text += "\n\n{color=green|The offering disappars in a thin air and after a moment a new item materialize in place. It seems your offer was correct and you are rewarded.}"
		
		dict.common_effects = [{code = 'make_loot', type = 'tableloot', pool = [['erebus_reward',3],['erebus_reward2',1]]}]
		dict.tags.append("free_loot")
	else:
		dict.text += "\n\nThe offering disappers from sight but there's no other changes around. It seems your offer wasn't liked."
		dict.options.append({code = 'close', reqs = [], text = "DIALOGUELEAVE"})
	
	
	input_handler.interactive_message_follow(dict, 'direct', [])

func erebus_character(person):
	
	var dict = {text = '[name] puts [his] hand on the altar. ', image = '', options = [], tags = ['active_character_translate'], common_effects = []}
	
	if randf() <= 0.5:
		dict.text += "\n\n{color=green|A small glow emits from the altar and enshrouds [name]. It seems [he] has been blessed...}"
		
		dict.common_effects.append({code = 'affect_active_character', type = 'effect', value = 'celena_bless'})
	else:
		dict.text += "\n\nAfter a few minutes nothing still happened and [name] decides to move on."
	
	dict.options.append({code = 'close', reqs = [], text = "DIALOGUELEAVE"})
	
	
	input_handler.interactive_message_follow(dict, 'direct', [])

func erebus_destroy(person):
	
	var dict = {text = '[name] demolishes the shrine and gathers the resources. ', image = '', options = [], tags = ['active_character_translate'], common_effects = []}
	
	
	dict.common_effects.append({code = 'make_loot', type = 'tableloot', pool = [['erebus_destroy_shrine',3]]})
	dict.tags.append("free_loot")
	
	
	input_handler.interactive_message_follow(dict, 'direct', [])
