extends Node

var professions = load("res://src/classes.gd").new().professions

var Skilllist = {
	praise = { #+25 obedience, +5 loyal, -10 fear
		code = 'praise',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 10,
		charges = 3,
		cooldown = 1,
		receiverdaylimit = 2,
		icon = null,
		tags = [],
	},
	warn = {#+25 fear, +10 obedience
		code = 'warn',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 10,
		charges = 3,
		cooldown = 1,
		receiverdaylimit = 2,
		icon = null,
		tags = [],
	},
	reward = {#+10 loyal, -gold
		code = 'reward',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 10,
		charges = 2,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	rewardsex = {#+35 obedience, +5 loyal, -25 lust (can't be used if lust is lower)
		code = 'rewardsex',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [{code = 'state', type = 'lust',operant = 'gte', value = 25}],
		effects = [],
		manacost = 0,
		charges = 2,
		cooldown = 1,
		energycost = 20,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	punish = {#+20 obedienc, +50 fear, target exhaustion -20
		code = 'punish',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		charges = 2,
		cooldown = 1,
		energycost = 20,
		receiverdaylimit = 2,
		icon = null,
		tags = [],
	},
	abuse = {#-25 fatigue to caster, +20 obedience to caster, -25 obedience to target, -10 loyal to target, +20 fear to the target, relationship -100
		code = 'abuse',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		charges = 2,
		cooldown = 1,
		energycost = 10,
		receiverdaylimit = 4,
		icon = null,
		tags = [],
	},
	publichumiliation = {#everyone fear +25, target fear + 60, target exhaustion -25
		code = 'publichumiliation',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 25,
		charges = 1,
		cooldown = 2,
		receiverdaylimit = 1,
		globallimit = 1, #limits you can use the skill per day regardless of users
		icon = null,
		tags = [],
	},
	publicsexhumiliation = {#everyone fear +20, everyone's lust +15, target fear + 35, target fatigue -20
		code = 'publichumiliation',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 25,
		charges = 1,
		cooldown = 3,
		receiverdaylimit = 1,
		globallimit = 1, #limits you can use the skill per day regardless of users
		icon = null,
		tags = [],
	},
	publicexecution = {#everyone present fear +65, target dies, target obedience must be < 25%
		code = 'publicexecution',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 0,
		charges = 1,
		cooldown = 3,
		receiverdaylimit = 1,
		globallimit = 1, #limits you can use the skill per day regardless of users
		icon = null,
		tags = [],
	},
	
	charm = {# + 50% lust growth per day for x*charm days (has check for preferences). buff overwrites itself + 100 relations
		code = 'seduce',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 20,
		charges = 3,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	seduce = {#lust + 100, obed +50, (has check for preferences, resisted by wits)
		code = 'seduce',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 10,
		charges = 1,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	greatseduce = {#lust + 100, obed +100, loyal +25, Resisted by wits
		code = 'greatseduce',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 10,
		charges = 1,
		cooldown = 4,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	drain = {#target -20 energy, -20% hp, -20% mana | caster takes all of it.
		code = 'drain',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 0,
		charges = 3,
		cooldown = 1,
		receiverdaylimit = 3,
		icon = null,
		tags = [],
	},
	serve = {#target -10 fatigue, -10 exhaustion, +20 energy, +25 obedience
		code = 'serve',
		name = '',
		descript = '',
		type = 'social',
		reqs = [{code = 'stat', type ='obedience', operant = 'gte', value = 75 }],
		targetreqs = [],
		effects = [],
		manacost = 0,
		charges = 2,
		cooldown = 1,
		energycost = 20,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	sedate = {#target +35 obedience
		code = 'sedate',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 15,
		energycost = 0,
		charges = 1,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	fear = {#target +35 fear
		code = 'fear',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 15,
		energycost = 0,
		charges = 1,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	innervate = {#target +50 energy
		code = 'innervate',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 25,
		energycost = 0,
		charges = 2,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	shackles = {#When attempting to escape, makes a check to break shackles instead: chance is max(0,(target.magic_factor - caster.magic_factor+1)) * 10 + 5 %. If chance successful -> remove debuff and make system message
		code = 'shackles',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 30,
		energycost = 0,
		charges = 1,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	greatshackles = {#When attempting to escape, makes a check to break shackles instead: chance is (target.magic_factor - caster.magic_factor+2) * 10 - 10%. If chance successful -> remove debuff and make system message
		code = 'greatshackles',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 50,
		energycost = 0,
		charges = 1,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	mindcontrol = {#100 obedience, +50 loyal. Success depends on magic factor and wits vs mf and wits of target
		code = 'mindcontrol',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 100,
		energycost = 0,
		charges = 1,
		cooldown = 3,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	hardwork = {#+50% productivity for the day
		code = 'hardwork',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 0,
		charges = 1,
		cooldown = 3,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	discipline = {#+50% production efficiency for 1 day (except for sex tasks)
		code = 'discipline',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 25,
		charges = 2,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	authority = {#Obedience +50, loyal +5
		code = 'authority',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 10,
		charges = 2,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	consume_soul = {#kills target, gain its experience
		code = 'consume_soul',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 150,
		energycost = 100,
		charges = 1,
		cooldown = 7,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	make_undead = {#turns target into undead (trait)
		code = 'make_undead',
		name = '',
		descript = '',
		type = 'social',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 75,
		energycost = 0,
		charges = 1,
		cooldown = 3,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
	},
	
	
	#Combat Skills
	inspire = {# buffs all team for 20% damage, 20% def/mdef for 1 combat
		code = 'inspire',
		name = '',
		descript = '',
		icon = null,
		type = 'combat',
		ability_type = 'skill',
		tags = ['buff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 0,
		energycost = 0,
		charges = 1,
		combatcooldown = 0,
		cooldown = 1,
		target = 'ally',
		target_number = 'all',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	command = {# single target buff: +25% damage for 3 turns
		code = 'command',
		name = '',
		descript = '',
		icon = null,
		type = 'combat',
		ability_type = 'spell', 
		tags = ['buff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 10,
		energycost = 0,
		charges = 0,
		combatcooldown = 3,
		cooldown = 0,
		target = 'ally',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	trap = {#enemy debuff: after using skill stun target for 2 turns and remove debuff. Requires trap
		code = 'trap',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['debuff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 3,
		cooldown = 0,
		catalysts = [{trap = 1}],
		target = 'enemy',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	weapon_refine = {#buffs ally: all skill damage increased by 30% until the end of combat. Only 3 times per day
		code = 'weapon_refine',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['buff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 0,
		energycost = 20,
		charges = 3,
		combatcooldown = 0,
		cooldown = 1,
		catalysts = [],
		target = 'ally',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	acid_bomb = {#reduces enemy armor by 25 for 3 turns and deals earth damage
		code = 'acid_bomb',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['damage'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 0,
		energycost = 0,
		charges = 0,
		combatcooldown = 4,
		cooldown = 0,
		catalysts = [{unstable_concoction = 1}],
		damage_type = 'earth',
		damage = 25,
		target = 'enemy',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	fire_bomb = {#deals fire damage
		code = 'fire_bomb',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['damage'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 0,
		energycost = 0,
		charges = 0,
		combatcooldown = 2,
		cooldown = 0,
		catalysts = [{unstable_concoction = 1}],
		damage_type = 'fire',
		damage = 50,
		target = 'enemy',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	distract = {#debuff: enemy evasion -30 (-20 for nonhumanoids), lasts 4 turns
		code = 'distract',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['debuff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 4,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	attract = {#debuff: enemy damage -30% for 3 turns
		code = 'attract',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['debuff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 1,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	enthral = {#stun target and self for 3 turns or until one is damaged, only humanoids
		code = 'enthral',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['debuff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 10,
		energycost = 0,
		charges = 0,
		combatcooldown = 0,
		cooldown = 1,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	attack = {#melee attack
		code = 'attack',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 0,
		energycost = 0,
		charges = 0,
		combatcooldown = 0,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'melee',
		damage_type = 'weapon',
		damage = 10,
		sfx = [], 
		sound = [],
	},
	ranged_attack = {#melee attack
		code = 'ranged_attack',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 0,
		energycost = 0,
		charges = 0,
		combatcooldown = 0,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'ranged',
		damage_type = 'weapon',
		damage = 10,
		sfx = [], 
		sound = [],
	},
	
	double_attack = {#double melee attack, must have melee weapon
		code = 'double_attack',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 2,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'melee',
		damage_type = 'weapon',
		damage = 50,
		sfx = [], 
		sound = [],
	},
	slash = {#melee attack vs all enemeis in row
		code = 'slash',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 8,
		energycost = 0,
		charges = 0,
		combatcooldown = 3,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'row',
		target_range = 'melee',
		damage_type = 'weapon',
		damage = 50,
		sfx = [], 
		sound = [],
	},
	protect = {# buff ally: takes skill damage from ally for 2 turns (damage is reduced by caster's def and resists), +20 def on self
		code = 'protect',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['buff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 0,
		energycost = 5,
		charges = 0,
		combatcooldown = 3,
		cooldown = 0,
		catalysts = [],
		target = 'ally',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	dragonmight = {#increases damage and armor by 25% until end of battle. Once in 2 days
		code = 'dragonmight',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['buff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 0,
		energycost = 0,
		charges = 0,
		combatcooldown = 0,
		cooldown = 2,
		catalysts = [],
		target = 'self',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	charge = {#deals 2.5 times damage with 25 extra armor penetration. Only once per battle
		code = 'charge',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage'],
		reqs = [{code = 'melee_weapon'}],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 1,
		combatcooldown = 0,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'melee',
		damage_type = 'weapon',
		damage = 75,
		sfx = [], 
		sound = [],
	},
	rage_strike = {#deals 1.5 times damage + 2*% of missing hp/100 (up to 3.5 times damage)
		code = 'rage_strike',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage'],
		reqs = [{code = 'melee_weapon'}],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 3,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'melee',
		damage_type = 'weapon',
		damage = 75,
		sfx = [], 
		sound = [],
	},
	magic_arrow = {#deals 1.5 times magic damage
		code = 'magic_arrow',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['damage'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 3,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'melee',
		damage_type = 'air',
		damage = 50,
		sfx = [], 
		sound = [],
	},
	lesser_heal = {#heals target for 1x damage
		code = 'lesser_heal',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['heal'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 2,
		cooldown = 0,
		catalysts = [],
		target = 'ally',
		target_number = 'single',
		target_range = 'any',
		damage_type = 'weapon',
		damage = 50,
		sfx = [], 
		sound = [],
	},
	serrated_shot = {#applies debuff: deal 25% bonus damage every turn for 4 turns
		code = 'serrated_shot',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage','debuff'],
		reqs = [{code = 'ranged_weapon'}],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 3,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'weapon',
		damage_type = 'weapon',
		damage = 50,
		sfx = [], 
		sound = [],
	},
	disruption_shot = {#Removes 1 buff from target (before damage hit), silences target for 2 turns (can't use spell type abilities)
		code = 'disruption_shot',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage'],
		reqs = [{code = 'ranged_weapon'}],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 4,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'weapon',
		damage_type = 'weapon',
		damage = 50,
		sfx = [], 
		sound = [],
	},
	mass_lesser_heal = {#heals all allies for 1x damage
		code = 'mass_lesser_heal',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['heal'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 15,
		energycost = 0,
		charges = 0,
		combatcooldown = 4,
		cooldown = 0,
		catalysts = [],
		target = 'ally',
		target_number = 'all',
		target_range = 'any',
		damage_type = 'weapon',
		damage = 50,
		sfx = [], 
		sound = [],
	},
	barrier = {#buff: protect from 100 damage for 3 turns
		code = 'barrier',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['buff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 15,
		energycost = 0,
		charges = 0,
		combatcooldown = 3,
		cooldown = 0,
		catalysts = [],
		target = 'ally',
		target_number = 'single',
		target_range = 'any',
		damage_type = 'weapon',
		damage = 50,
		sfx = [], 
		sound = [],
	},
	blizzard = {#water damage to all enemies, 50% to reduce speed by 20 for 2 turns
		code = 'blizzard',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['damage'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 20,
		energycost = 0,
		charges = 0,
		combatcooldown = 2,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'all',
		target_range = 'any',
		damage_type = 'water',
		damage = 50,
		sfx = [], 
		sound = [],
	},
	bless = {#buff: increase damage, armor, mdef, evasion, hitrate by 10 for 3 turns 
		code = 'bless',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['buff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 1,
		cooldown = 0,
		catalysts = [],
		target = 'ally',
		target_number = 'single',
		target_range = 'any',
		damage_type = 'weapon',
		damage = 0,
		sfx = [], 
		sound = [],
	},
	blood_magic = {#sacrifice 10% health to get 3x mana from it, 3 charges per day 
		code = 'blood_magic',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = [],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 0,
		energycost = 0,
		charges = 3,
		combatcooldown = 0,
		cooldown = 1,
		catalysts = [],
		target = 'self',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	blood_explosion = { #sacrifice 75% health to deal 2x weapon spell damage to all enemies, usable once a day, can't use if health <= 75% 
		code = 'blood_explosion',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = [],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 0,
		energycost = 0,
		charges = 3,
		combatcooldown = 0,
		cooldown = 1,
		catalysts = [],
		target = 'enemy',
		target_number = 'all',
		target_range = 'any',
		damage_type = 'fire',
		sfx = [], 
		sound = [],
	},
	fly_evasion = {#buff on self: +25 evasion for 4 turns
		code = 'fly_evasion',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['buff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 0,
		cooldown = 0,
		catalysts = [],
		target = 'self',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	bleeding_strike = {#applies debuff: deal 25% bonus damage every turn for 4 turns
		code = 'bleeding_strike',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage','debuff'],
		reqs = [{code = 'bladed_weapon'}],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 2,
		cooldown = 0,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'weapon',
		damage_type = 'weapon',
		damage = 50,
		sfx = [], 
		sound = [],
	},
	hide = {#buff on self: hiding breaks on spell cast, can't be targeted by non-aoe hits; if only possible target on the row for melee -> backrow can be attacked. If only target left, hide is canceled. 
		code = 'hide',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['buff'],
		reqs = [],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 0,
		combatcooldown = 0,
		cooldown = 0,
		catalysts = [],
		target = 'self',
		target_number = 'single',
		target_range = 'any',
		sfx = [], 
		sound = [],
	},
	assassinate = {#must be in hide, deals 400% damage, only once per day
		code = 'assassinate',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage'],
		reqs = [{code = 'bladed_weapon'}],
		targetreqs = [],
		effects = [], 
		manacost = 5,
		energycost = 0,
		charges = 1,
		combatcooldown = 0,
		cooldown = 1,
		catalysts = [],
		target = 'enemy',
		target_number = 'single',
		target_range = 'any',
		damage_type = 'weapon',
		damage = 50,
		sfx = [], 
		sound = [],
	},
}



var effects = {
	
	lightarmorencumb = {#Every light armor piece weared without light armor trait increases spell mana cost by 15% to 60% total 
		code = 'lightarmorencumb',
		name = '',
		descript = '',
		icon = null,
		visible = true,
	},
	heavyarmorencumb = {#Every heavy armor piece weared without heavy armor trait increases spell mana cost by 20% to 80% total and reduces evasion by 10 (can go negative)
		code = 'lightarmorencumb',
		name = '',
		descript = '',
		icon = null,
		visible = true,
	},
	exhaustion = {#when exhaustion > 0, apply debuf. Every tick while exhaustion > 0 increases magnitude by 1, othewise decrease magnitude by 1. When it reaches 12, add debuff: reduce maxhp by 20%, when it reaches 36: reduce maxhp by 50% and all bonuses by 20 (physics, wits, charm, sex), when it reaches 84: reduce maxhp by 75% and all bonuses by 30, when it reaches 168: character dies. If magnitude reduced to 0 - remove debuff. 
		code = 'exhaustion',
		name = '',
		descript = '',
		icon = null,
		visible = true,
	},
	fatigue = {#when fatigue >= 30, apply debuf: every tick while fatigue >= 30 increase magnitude by 1, otherwise decrease magnitude by 1. If magnitude > 24: obedience drops by 50% faster, wit_bonus -15, charm_bonus -15, if magnitude > 48: obedience drops by 100% faster, wit_bonus -25, charm_bonus -25, energy task consumption increased by 100%.
		code = 'fatigue',
		name = '',
		descript = '',
		icon = null,
		visible = true,
	},
	
	
	starvation = {#energy recovery -50%, +20 exhaustion: happens when no food eaten
		
	},
	#will add to eating checks personaly
	hated_food_combined = {#-10 fatigue: when eating cooked hated food with other tags
		
	},
	#Trait: Small
	small_size = {#given to short races: goblins, gnomes, fairies. physical tasks -25%, melee damage -20%
		
	},
	
}
