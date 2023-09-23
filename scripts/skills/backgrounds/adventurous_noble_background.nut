this.adventurous_noble_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.adventurous_noble";
		this.m.Name = "Adventurous Noble";
		this.m.Icon = "ui/backgrounds/background_06.png";
		this.m.BackgroundDescription = "Adventurous Nobles tend to have high resolve and melee skills, but often neglect ranged defense.";
		this.m.GoodEnding = "Adventurousness never leaves the soul of a %person% like %name%. {Instead of returning to %their% noble family, %they% left the %companyname% and headed east in search of rare beasts. Word has it %they% returned to town with the head of what looked like a giant lizard, but you don\'t believe such fantastical tripe. | %They% departed the %companyname% and ventured west, sailing across the oceans to unseen lands. There\'s no telling where %they% is these days, but you\'ve little doubt that %they%\'ll be coming back with stories to tell. | %They% retired from the %companyname% and, instead of returning to %their% noble family, headed south. Word has it %they% fought in a great noble civil war, killed an orc warlord, climbed the highest mountain in the land, and is currently writing an epic about %their% travels. | The %noble% left the %companyname% and, preferring the life of adventure to noble boredom, %they% headed north. Word has it that %they%\'s currently marching a troop of explorers to the furthest reaches of the world.}";
		this.m.BadEnding = "%name% departed the %companyname% and continued %their% adventuring elsewhere. {%They% headed east, hoping to discover the source of the greenskins, but the nobleman has not been heard from since. | %They% headed north into the snowy wastes. Word has it %they% was seen a week ago, marching south this time, looking rather pale and shuffling moreso than walking. | %They% headed south into brutal marshlands. Word has it that a mysterious flame appeared in the fog and %they% walked toward it. The men who saw this said %they% disappeared into the mist and never returned. | %They% headed west and sailed the open sea. Despite having no experience at sea, %they% saw fit to make %themself% captain of the boat. They say pieces of %their% ship and dead sailors kept washing ashore for weeks.}";
		this.m.HiringCost = 300;
		this.m.DailyCost = 35;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_beasts",
			"trait.clubfooted",
			"trait.irrational",
			"trait.hesitant",
			"trait.drunkard",
			"trait.fainthearted",
			"trait.craven",
			"trait.dastard",
			"trait.fragile",
			"trait.insecure",
			"trait.asthmatic",
			"trait.spartan",
			"trait.hate_nobles",
			"trait.double_tongued"
		];
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Merciless;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Names = this.Const.Strings.KnightNames;
		this.m.Level = this.Math.rand(1, 3);
		this.m.BackgroundType = this.Const.BackgroundType.Combat | this.Const.BackgroundType.Noble | this.Const.BackgroundType.Crusader | this.Const.BackgroundType.Educated;
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[2];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[2];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.SwordTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.DaggerTree,
				this.Const.Perks.CrossbowTree
			],
			Defense = [
				this.Const.Perks.MediumArmorTree
			],
			Traits = [
				this.Const.Perks.InspirationalTree,
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.ViciousTree
			],
			Enemy = [],
			Class = [],
			Magic = []
		};
	}

	function onBuildDescription()
	{
		return "{A minor noble | As the third in the line of succession | A young and brash %noble% | A skilled swordsman}, %name%\'s life at court {had grown stale for %them% | was not exciting enough for %them% with endless studying of court etiquette and family lineage | felt like wasting the best time of %their% life | was not half as exciting to %them% as the tales of adventures, battles, fearsome beasts to vanquish and fair maidens to conquer}. {Wearing the family crest proudly | At the encouragement of %their% brother | To the frustration of %their% mother | Finally making a decision to change things}, %name% rode out to {prove %themself% | make a name for themselves | earn glory on the battlefield | test %their% skills in battle} and {live life to its fullest as %they% imagined it from behind the castle walls | see all the wonders and exotic places of the world | earn %their% place in the world | be knighted for %their% valor | become famous and loved in all the known world | become infamous and feared in all the known world}.";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				4,
				-1
			],
			Bravery = [
				15,
				20
			],
			Stamina = [
				0,
				5
			],
			MeleeSkill = [
				10,
				15
			],
			RangedSkill = [
				0,
				5
			],
			MeleeDefense = [
				3,
				8
			],
			RangedDefense = [
				-10,
				-5
			],
			Initiative = [
				-7,
				-2
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/fencing_sword"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/pike"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/rondel_dagger"));
			items.equip(this.new("scripts/items/weapons/legend_parrying_dagger"));
		}

		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"mail_shirt"
			],
			[
				1,
				"basic_mail_shirt"
			],
			[
				1,
				"mail_hauberk"
			]
		]));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				2,
				"nasal_helmet"
			],
			[
				2,
				"padded_nasal_helmet"
			],
			[
				1,
				"nasal_helmet_with_mail"
			],
			[
				1,
				"legend_noble_floppy_hat"
			],
			[
				1,
				"legend_noble_hat"
			],
			[
				1,
				"legend_noble_hood"
			],
			[
				1,
				"legend_noble_crown"
			],
			[
				1,
				"mail_coif"
			],
			[
				2,
				""
			]
		]));
	}

});

