extends Node

var professions = load("res://src/classes.gd").new().professions

var Skilllist = {
	praise = { #+25 obedience, +5 loyal
		code = 'praise',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 10,
		charges = 3,
		cooldown = 1,
		receiverdaylimit = 2,
		icon = load("res://assets/images/iconsskills/Praise.png"),
		tags = [],
		dialogue = 'dialogue_praise',
		value = [['25'],['5']],
		damagestat = ['obedience','loyal'],
	},
	warn = {#+25 fear, +10 obedience
		code = 'warn',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 10,
		charges = 3,
		cooldown = 1,
		receiverdaylimit = 2,
		icon = load("res://assets/images/iconsskills/Warn.png"),
		tags = [],
		value = [['10'],['25']],
		damagestat = ['obedience','fear'],
	},
	reward = {#+10 loyal, -gold
		code = 'reward',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 10,
		goldcost = 1,
		charges = 2,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Reward.png"),
		tags = [],
		value = ['10'],
		damagestat = 'loyal',
	},
	rewardsex = {#+35 obedience, +5 loyal, -25 lust (can't be used if lust is lower)
		code = 'rewardsex',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [{code = 'state', type = 'lust',operant = 'gte', value = 25}],
		effects = [],
		manacost = 0,
		charges = 2,
		cooldown = 1,
		energycost = 20,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Reward_with_sex 3.png"),
		tags = [],
		value = [['35'],['5'],['-25']],
		damagestat = ['obedience','loyal','lust'],
	},
	punish = {#+20 obedienc, +50 fear, target exhaustion +20
		code = 'punish',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		charges = 2,
		cooldown = 1,
		energycost = 20,
		receiverdaylimit = 2,
		icon = load("res://assets/images/iconsskills/Punish.png"),
		tags = [],
		value = [['20'],['50'],['20']],
		damagestat = ['obedience','fear','exhaustion'],
	},
	abuse = {#-25 fatigue to caster, +20 obedience to caster, -25 obedience to target, -10 loyal to target, +20 fear to the target, relationship -100
		code = 'abuse',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		charges = 2,
		cooldown = 1,
		energycost = 10,
		receiverdaylimit = 4,
		icon = load("res://assets/images/iconsskills/Punish.png"),
		tags = [],
		value = [['-25'],['20'],['-25'],['-10'],['20'],['-100']],
		damagestat = ['fatigue','obedience','obedience','loyal','fear','relationship'],
		receiver = ['caster','caster','target','target','target','target']
	},
	publichumiliation = {#everyone fear +25, target fear + 60, target exhaustion -25
		code = 'publichumiliation',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
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
		value = [['25'],['60'],['-25']],
		damagestat = ['fear','fear','exhaustion'],
		receiver = ['all','target','target']
	},
	publicsexhumiliation = {#everyone fear +20, everyone's lust +15, target fear + 35, target fatigue -20
		code = 'publichumiliation',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
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
		value = [['20'],['35'],['-20'],['15']],
		damagestat = ['fear','fear','fatigue','lust'],
		receiver = ['all','target','target','all']
	},
	publicexecution = {#everyone present fear +65, target dies, target obedience must be < 25%
		code = 'publicexecution',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [{code = 'state', type = 'obedience',operant = 'lte', value = 25}],
		effects = ['e_target_kill'],
		manacost = 0,
		energycost = 0,
		charges = 1,
		cooldown = 3,
		receiverdaylimit = 1,
		globallimit = 1, #limits you can use the skill per day regardless of users
		icon = null,
		tags = [],
		value = ['65'],
		damagestat = 'fear',
		receiver = 'all'
	},
	
	charm = {# + 50% lust growth per day for x*charm days (has check for preferences). buff overwrites itself + 100 relations
		code = 'charm',#fixed
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [],
		effects = ['e_s_charm'],
		manacost = 0,
		energycost = 20,
		charges = 3,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsitems/Charm.png"),
		tags = [],
		value = ['100'],
		damagestat = 'relation',
	},
	seduce = {#lust + 100, obed +50, (has check for preferences, resisted by wits)
		code = 'seduce',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 10,
		charges = 1,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Seduce.png"),
		tags = [],
		value = ['100', '50'],
		damagestat = ['lust','obedience']
	},
	greatseduce = {#lust + 100, obed +100, loyal +25, Resisted by wits
		code = 'greatseduce',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 10,
		charges = 1,
		cooldown = 4,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Great_Seduce.png"),
		tags = [],
		value = ['100', '50', '25'],
		damagestat = ['lust','obedience','loyalty']
	},
	drain = {#target -20 energy, -20% hp, -20% mana | caster takes all of it.
		code = 'drain',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 0,
		energycost = 0,
		charges = 3,
		cooldown = 1,
		receiverdaylimit = 3,
		icon = null,
		tags = ['drain'],
		is_drain = true,
		value = [['-20'],['target.hp','*-0.2'],['target.mana','*-0.2']],
		damagestat = ['energy','hp','mana'],
	},
	serve = {#target -10 fatigue, -10 exhaustion, +20 energy, +25 obedience
		code = 'serve',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [{code = 'stat', type ='obedience', operant = 'gte', value = 75 }],
		targetreqs = [],
		effects = [],
		manacost = 0,
		charges = 2,
		cooldown = 1,
		energycost = 20,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Serve.png"),
		tags = [],
		value = [['25'],['-10'],['-10'],['20']],
		damagestat = ['obedience','fatigue','exhaustion','energy'],
		receiver = ['target','target','target','target']
	},
	sedate = {#target +35 obedience
		code = 'sedate',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'spell',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 15,
		energycost = 0,
		charges = 1,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Sedate.png"),
		tags = [],
		value = ['35'],
		damagestat = 'obedience',
	},
	fear = {#target +35 fear
		code = 'fear',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'spell',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 15,
		energycost = 0,
		charges = 1,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Fear.png"),
		tags = [],
		value = ['35'],
		damagestat = 'fear',
	},
	innervate = {#target +50 energy
		code = 'innervate',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'spell',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 25,
		energycost = 0,
		charges = 2,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Innervate.png"),
		tags = [],
		value = ['50'],
		damagestat = 'energy',
	},
	shackles = {#When attempting to escape, makes a check to break shackles instead: chance is max(0,(target.magic_factor - caster.magic_factor+1)) * 10 + 5 %. If chance successful -> remove debuff and make system message
		code = 'shackles',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'spell',
		reqs = [],
		targetreqs = [],
		effects = ['e_s_shackles1'],
		manacost = 30,
		energycost = 0,
		charges = 1,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Magic Shackles.png"),
		tags = [],
		value = ['0'],
		damagestat = 'no_stat'
	},
	greatshackles = {#When attempting to escape, makes a check to break shackles instead: chance is (target.magic_factor - caster.magic_factor+2) * 10 - 10%. If chance successful -> remove debuff and make system message
		code = 'greatshackles',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'spell',
		reqs = [],
		targetreqs = [],
		effects = ['e_s_shackles2'],
		manacost = 50,
		energycost = 0,
		charges = 1,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Strong Magic Shackles.png"),
		tags = [],
		value = ['0'],
		damagestat = 'no_stat'
	},
	mindcontrol = {#100 obedience, +50 loyal. Success depends on magic factor and wits vs mf and wits of target
		code = 'mindcontrol',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'spell',
		reqs = [],
		targetreqs = [],
		effects = [],
		manacost = 100,
		energycost = 0,
		charges = 1,
		cooldown = 3,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Mind_Control.png"),
		tags = [],
		value = ['100', '50'],
		damagestat = ['obedience', 'loyalty']
	},
	hardwork = {#+50% productivity for the day
		code = 'hardwork',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [],
		effects = ['e_s_hardwork'],
		manacost = 0,
		energycost = 0,
		charges = 1,
		cooldown = 3,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
		value = ['0'],
		damagestat = 'no_stat'
	},
	discipline = {#+50% production efficiency for 1 day (except for sex tasks)
		code = 'discipline',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
		reqs = [],
		targetreqs = [],
		effects = ['e_s_discipline'],
		manacost = 0,
		energycost = 25,
		charges = 2,
		cooldown = 1,
		receiverdaylimit = 1,
		icon = load("res://assets/images/iconsskills/Discipline.png"),
		tags = [],
		value = ['0'],
		damagestat = 'no_stat'
	},
	authority = {#Obedience +50, loyal +5
		code = 'authority',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'skill',
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
		value = [['50'],['5']],
		damagestat = ['obedience','loyal'],
		receiver = 'target'
	},
	consume_soul = {#kills target, gain its experience
		code = 'consume_soul',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'spell',
		reqs = [],
		targetreqs = [],
		effects = ['e_target_kill'],
		manacost = 150,
		energycost = 100,
		charges = 1,
		cooldown = 7,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
		value = ['target.base_exp'],
		damagestat = 'base_exp',
		receiver = 'caster',
	},
	make_undead = {#turns target into undead (trait)
		code = 'make_undead',
		name = '',
		descript = '',
		type = 'social',
		ability_type = 'spell',
		reqs = [],
		targetreqs = [],
		effects = ['e_s_undead'],
		manacost = 75,
		energycost = 0,
		charges = 1,
		cooldown = 3,
		receiverdaylimit = 1,
		icon = null,
		tags = [],
		value = ['0'],
		damagestat = 'no_stat'
	},
	
	
	#Combat Skills
	#attack
	#ranged_attack
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
		effects = ['e_s_inspire'], 
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
		value = ['0'],
		damagestat = 'no_stat'
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
		effects = ['e_s_command'], 
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
		value = ['0'],
		damagestat = 'no_stat'
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
		effects = ['e_s_trap'], 
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
		value = ['0'],
		damagestat = 'no_stat'
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
		effects = ['e_s_refine'], 
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
		value = ['0'],
		damagestat = 'no_stat'
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
		effects = ['e_s_acid'], 
		manacost = 0,
		energycost = 0,
		charges = 0,
		combatcooldown = 4,
		cooldown = 0,
		catalysts = [{unstable_concoction = 1}],
		damage_type = 'earth',
		#damage = 25,
		value = ['25'],#not sure
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
		#damage = 50,
		value = ['50'],
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
		effects = ['e_s_distract','e_s_distract1'], 
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
		value = ['0'],
		damagestat = 'no_stat'
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
		effects = ['e_s_attract'], 
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
		value = ['0'],
		damagestat = 'no_stat'
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
		effects = ['e_s_entral'], 
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
		value = ['0'],
		damagestat = 'no_stat'
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
		aipriority = 1,
		aipatterns = ['attack'],
		allowedtargets = ['enemy'],
		value = ['caster.atk'],
		sfx = [], 
		sounddata = {initiate = null, strike = null, hit = null},
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
		aipriority = 1,
		aipatterns = ['attack'],
		allowedtargets = ['enemy'],
		value = ['caster.atk'],
		sfx = [], 
		sounddata = {initiate = null, strike = null, hit = null},
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
		repeat = 2,
		#damage = 50,
		value = ['caster.atk'],#i think so
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
		target_number = 'row',#not sure
		target_range = 'melee',
		damage_type = 'weapon',
		#damage = 50,
		value = ['caster.atk'],#i think so
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
		effects = ['e_s_protect'], 
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
		value = ['0'],
		damagestat = 'no_stat'
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
		effects = ['e_s_dragonmight'], 
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
		value = ['0'],
		damagestat = 'no_stat'
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
		#damage = 75,
		sfx = [], 
		sound = [],
		armor_p = ['caster.armorpenetration','+25'],
		value = ['caster.atk', '*2.5']
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
		effects = ['e_s_ragestrike'], 
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
		#damage = 75,
		sfx = [], 
		sound = [],
		value = ['caster.atk']
	},
	magic_arrow = {#deals 1 times magic damage
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
		#damage = 50,
		sfx = [], 
		sound = [],
		value = ['caster.matk']
	},
	lesser_heal = {#heals target for 1x damage
		code = 'lesser_heal',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['heal', 'noreduce'],
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
		damage_type = 'weapon',#not sure but not matters
		#damage = 50,
		sfx = [], 
		sound = [],
		value = ['caster.matk']
	},
	serrated_shot = {#applies debuff: deal 25% bonus damage every turn for 4 turns
	#i understand this as bonus damage over time
		code = 'serrated_shot',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage','debuff'],
		reqs = [{code = 'ranged_weapon'}],
		targetreqs = [],
		effects = ['e_s_bleed'], 
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
		#damage = 50,
		sfx = [], 
		sound = [],
		value = ['caster.atk']
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
		effects = ['e_s_disruption'], 
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
		#damage = 50,
		sfx = [], 
		sound = [],
		value = ['caster.atk']
	},
	mass_lesser_heal = {#heals all allies for 1x damage
		code = 'mass_lesser_heal',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = ['heal', 'noreduce'],
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
		damage_type = 'weapon',#not sure but not matters
		#damage = 50,
		sfx = [], 
		sound = [],
		value = ['caster.matk']
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
		effects = ['e_s_barrier'], 
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
		#damage = 50,
		sfx = [], 
		sound = [],
		value = ['0'],
		damagestat = 'no_stat'
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
		effects = ['e_s_blizz'], 
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
		#damage = 50,
		value = ['caster.matk'],
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
		effects = ['e_s_bless'], 
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
		value = ['0'],
		damagestat = 'no_stat'
	},
	blood_magic = {#sacrifice 10% health to get 3x mana from it, 3 charges per day 
		code = 'blood_magic',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'spell',
		tags = [],#no log for skill result - until combat reworking to different log tags for hp and mana values
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
		value = [['caster.hp','*-0.1'],['caster.hp','*0.03']],
		damagestat = ['hp', 'mana']
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
		effects = ['e_s_bloodex'], 
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
		value = ['caster.matk','*2']
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
		effects = ['e_s_fly'], 
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
		value = ['0'],
		damagestat = 'no_stat'
	},
	bleeding_strike = {#applies debuff: deal 25% bonus damage every turn for 4 turns
	#so additional effect is the same as of serrated shot
		code = 'bleeding_strike',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage','debuff'],
		reqs = [{code = 'bladed_weapon'}],
		targetreqs = [],
		effects = ['e_s_bleed'], 
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
		#damage = 50,
		value = ['caster.atk'],
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
		effects = ['e_s_hide'], 
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
		value = ['0'],
		damagestat = 'no_stat'
	},#not hardcoded in combat
	assassinate = {#must be in hide, deals 400% damage, only once per day
		code = 'assassinate',
		name = '',
		descript = '',
		icon = null,
		type = 'combat', 
		ability_type = 'skill',
		tags = ['damage'],
		reqs = [{code = 'bladed_weapon'}],#add hide = true req
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
		#damage = 50,
		sfx = [], 
		sound = [],
		value = ['caster.atk', '*4.0']
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
