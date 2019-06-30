extends Node



var enemygroups = {
	rats_easy = {reqs = [], units = {rat = [2,6]}},
	rats_goblins_easy = {reqs = [], units = {rat = [1,4], cave_goblin_melee = [1,3]}},
	bandits_easy = {reqs = [], units = {bandit_melee = [2,3]}},
	bandits_easy2 = {reqs = [], units = {bandit_melee = [1,3], bandit_archer = [1,2]}},
	bandits_easy3 = {reqs = [], units = {bandit_melee = [1,2], bandit_archer = [1,3]}},
	bandits_easy_boss = {reqs = [], units = {bandit_melee = [0,2], boss = [1,1], bandit_archer = [0,1]}},
	
	goblins_easy = {reqs = [], units = {cave_goblin_melee = [2,3]}},
	goblins_easy2 = {reqs = [], units = {cave_goblin_melee = [1,3], cave_goblin_archer = [1,2]}},
	goblins_easy3 = {reqs = [], units = {cave_goblin_melee = [1,2], cave_goblin_archer = [1,3]}},
	
	wolves_easy1 = {reqs = [], units = {wolf = [2,3]}},
	wolves_easy2 = {reqs = [], units = {wolf = [3,5]}},
	
	rats = {reqs = [], units = {rat = [3,5]}},
}

var enemies = {
	bandit_melee = {
		code = 'bandit_melee',
		name = '',
		descript = '',
		hp = 100,
		armor = 15,
		mdef = 0,
		hitrate = 85,
		evasion = 10,
		armorpenetration = 0,
		damage = 10,
		speed = 40,
		resists = {},
		race = 'humanoid',
		loot = 'bandit_loot',
		icon = null,
		body = null,
		skills = ['attack'],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['melee'],
		xpreward = 15,
	},
	bandit_archer = {
		code = 'bandit_archer',
		name = '',
		descript = '',
		hp = 80,
		armor = 5,
		mdef = 0,
		hitrate = 95,
		evasion = 0,
		armorpenetration = 0,
		damage = 10,
		speed = 50,
		resists = {},
		race = 'humanoid',
		loot = 'bandit_loot',
		icon = null,
		body = null,
		skills = ['ranged_attack'],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['ranged'],
		xpreward = 15,
	},
	bandit_mage = {
		code = 'bandit_mage',
		name = '',
		descript = '',
		hp = 65,
		armor = 0,
		mdef = 10,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		damage = 10,
		speed = 30,
		resists = {},
		race = 'humanoid',
		loot = 'bandit_loot',
		icon = null,
		body = null,
		skills = ['attack'],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['ranged'],
		xpreward = 20,
	},
	cave_goblin_melee = {
		code = 'cave_goblin_melee',
		name = '',
		descript = '',
		hp = 65,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 25,
		armorpenetration = 0,
		damage = 10,
		speed = 45,
		resists = {},
		race = 'humanoid',
		loot = 'goblin_loot',
		icon = null,
		body = null,
		skills = ['attack'],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['melee'],
		xpreward = 10,
	},
	cave_goblin_archer = {
		code = 'cave_goblin_archer',
		name = '',
		descript = '',
		hp = 55,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 20,
		armorpenetration = 0,
		damage = 10,
		speed = 45,
		resists = {},
		race = 'humanoid',
		loot = 'goblin_loot',
		icon = null,
		body = null,
		skills = ['ranged_attack'],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['ranged'],
		xpreward = 10,
	},
	cave_goblin_mage = {
		code = 'cave_goblin_mage',
		name = '',
		descript = '',
		hp = 45,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 25,
		armorpenetration = 0,
		damage = 10,
		speed = 25,
		resists = {},
		race = 'humanoid',
		loot = 'goblin_loot',
		icon = null,
		body = null,
		skills = ['attack'],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['ranged'],
		xpreward = 10,
	},
	ogre_melee = {
		code = 'ogre_melee',
		name = '',
		descript = '',
		hp = 250,
		armor = 60,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		damage = 40,
		speed = 35,
		resists = {},
		race = 'humanoid',
		loot = 'ogre_loot',
		icon = null,
		body = null,
		skills = ['attack'],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['melee'],
		xpreward = 50,
	},
	ogre_mage = {
		code = 'ogre_mage',
		name = '',
		descript = '',
		hp = 200,
		armor = 30,
		mdef = 30,
		hitrate = 80,
		evasion = 0,
		armorpenetration = 0,
		damage = 30,
		speed = 25,
		resists = {},
		race = 'humanoid',
		loot = 'ogre_loot',
		icon = null,
		body = null,
		skills = ['attack'],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['ranged'],
		xpreward = 40,
	},
	troll = {
		code = 'troll',
		name = '',
		descript = '',
		hp = 400,
		armor = 20,
		mdef = 20,
		hitrate = 100,
		evasion = 10,
		armorpenetration = 15,
		damage = 60,
		speed = 40,
		resists = {fire = -50},
		race = 'humanoid',
		loot = 'troll_loot',
		icon = null,
		body = null,
		skills = ['attack'],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['melee'],
		xpreward = 80,
	},
	skeleton_melee = {
		code = 'skeleton_melee',
		name = '',
		descript = '',
		hp = 90,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		damage = 15,
		speed = 35,
		resists = {air = 25, water = 25},
		race = 'undead',
		loot = 'skeleton_melee_loot',
		icon = null,
		body = null,
		skills = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['melee'],
		xpreward = 20,
	},
	skeleton_archer = {
		code = 'skeleton_archer',
		name = '',
		descript = '',
		hp = 60,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		damage = 15,
		speed = 45,
		resists = {air = 25, water = 25},
		race = 'undead',
		loot = 'skeleton_archer',
		icon = null,
		body = null,
		skills = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['ranged'],
		xpreward = 20,
	},
	zombie = {
		code = 'zombie',
		name = '',
		descript = '',
		hp = 120,
		armor = 15,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		damage = 20,
		speed = 20,
		resists = {},
		race = 'undead',
		loot = 'zombie_loot',
		icon = null,
		body = null,
		skills = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['melee'],
		xpreward = 20,
	},
	wolf = {
		code = 'wolf',
		name = '',
		descript = '',
		hp = 90,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		damage = 15,
		speed = 30,
		resists = {},
		race = 'beast',
		loot = 'wolf_loot',
		icon = null,
		body = null,
		skills = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['melee'],
		xpreward = 10,
	},
	spider = {
		code = 'spider',
		name = '',
		descript = '',
		hp = 90,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		damage = 15,
		speed = 30,
		resists = {},
		race = 'beast',
		loot = 'spider_loot',
		icon = null,
		body = null,
		skills = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['ranged'],
		xpreward = 15,
	},
	rat = {
		code = 'rat',
		name = '',
		descript = '',
		hp = 40,
		armor = 0,
		mdef = 0,
		hitrate = 85,
		evasion = 0,
		armorpenetration = 0,
		damage = 15,
		speed = 30,
		resists = {},
		race = 'beast',
		loot = 'rat_loot',
		icon = null,
		body = null,
		skills = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['melee'],
		xpreward = 5,
	},
	gryphon = {
		code = 'gryphon',
		name = '',
		descript = '',
		hp = 300,
		armor = 25,
		mdef = 50,
		hitrate = 120,
		evasion = 40,
		armorpenetration = 0,
		damage = 90,
		speed = 50,
		resists = {},
		race = 'beast',
		loot = 'gryphon_loot',
		icon = null,
		body = null,
		skills = [],
		tags = [],
		is_character = false,
		gear = [],
		ai = ['melee'],
		xpreward = 100,
	},
}






#		usables = [{code = 'morsel', min = 1, max = 1, chance = 25}],
var loottables = {
	rat_loot = {
		materials = [{code = 'leather', min = 1, max = 1, chance = 15}],
	},
	spider_loot = {
		materials = [{code = 'clothsilk', min = 1, max = 2, chance = 50}],
	},
	wolf_loot = {
		materials = [{code = 'leather', min = 1, max = 3, chance = 50}],
	},
	gryphon_loot = {
		materials = [{code = 'leathermythic', min = 5, max = 8, chance = 100}],
	},
	skeleton_loot = {
		materials = [{code = 'bone', min = 1, max = 4, chance = 75}],
	},
	goblin_loot = {
		materials = [{code = 'stone', min = 1, max = 2, chance = 50}],
		gold = {min = 1, max = 2, chance = 25},
	},
	bandit_loot = {
		materials = [{code = 'cloth', min = 1, max = 2, chance = 50}],
		gold = {min = 1, max = 3, chance = 75},
	},
	troll_loot = {
		materials = [{code = 'cloth', min = 1, max = 2, chance = 50}],
		gold = {min = 1, max = 3, chance = 75},
	},
	ogre_loot = {
		materials = [{code = 'cloth', min = 1, max = 2, chance = 50}],
		gold = {min = 1, max = 3, chance = 75},
	},
	
}
