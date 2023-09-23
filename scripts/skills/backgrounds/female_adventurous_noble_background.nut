this.female_adventurous_noble_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.female_adventurous_noble";
		this.m.Name = "Adventurous Lady";
		this.m.Icon = "ui/backgrounds/adventurous_noble_woman.png";
		this.m.BackgroundDescription = "Adventurous Ladies tend to have high resolve and ranged skills, but often neglect melee defense.";
		this.m.GoodEnding = "Adventurousness never leaves the soul of a woman like %name%. {Instead of returning to her noble family, she left the %companyname% and headed east in search of rare beasts. Word has it she returned to town with the head of what looked like a giant lizard, but you don\'t believe such fantastical tripe. | She departed the %companyname% and ventured west, sailing across the oceans to unseen lands. There\'s no telling where he is these days, but you\'ve little doubt that he\'ll be coming back with stories to tell. | She retired from the %companyname% and, instead of returning to her noble family, headed south. Word has it she fought in a great noble civil war, killed an orc warlord, climbed the highest mountain in the land, and is currently writing an epic about her travels. | The noblewoman left the %companyname% and, preferring the life of adventure to noble boredom, she headed north. Word has it that she\'s currently marching a troop of explorers to the furthest reaches of the world.}";
		this.m.BadEnding = "%name% departed the %companyname% and continued her adventuring elsewhere. {She headed east, hoping to discover the source of the greenskins, but the noblewoman has not been heard from since. | She headed north into the snowy wastes. Word has it she was seen a week ago, marching south this time, looking rather pale and shuffling moreso than walking. | She headed south into brutal marshlands. Word has it that a mysterious flame appeared in the fog and she walked toward it. The men who saw this said she disappeared into the mist and never returned. | She headed west and sailed the open sea. Despite having no experience at sea, she saw fit to make himself captain of the boat. They say pieces of her ship and dead sailors kept washing ashore for weeks.}";
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
			"trait.hate_nobles"
		];
		this.m.Faces = this.Const.Faces.PrettyFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.FemaleMuscular;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Merciless;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.BackgroundType = this.Const.BackgroundType.Female | this.Const.BackgroundType.Combat | this.Const.BackgroundType.Noble | this.Const.BackgroundType.Ranger | this.Const.BackgroundType.Educated;
		this.m.Level = this.Math.rand(1, 3);
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[2];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[2];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.BowTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.CrossbowTree,
				this.Const.Perks.SwordTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.AgileTree,
				this.Const.Perks.FastTree,
				this.Const.Perks.InspirationalTree
			],
			Enemy = [
				this.Const.Perks.ArchersTree
			],
			Class = [],
			Magic = []
		};
	}

	function onBuildDescription()
	{
		return "{A minor noble | As the third in the line of succession | A young and brash noble | A skilled swordswoman}, %name%\'s life at court {had grown stale for her | was not exciting enough for her with endless studying of court etiquette and family lineage | felt like wasting the best time of her life | was not half as exciting to her as the tales of adventures, battles, fearsome beasts to vanquish and fair maidens to conquer}. {Wearing the family crest proudly | At the encouragement of her brother | To the frustration of her mother | Finally making a decision to change things}, %name% rode out to {prove herself | make a name for herself | earn glory on the battlefield | test her skills in battle} and {live life to its fullest as she imagined it from behind the castle walls | see all the wonders and exotic places of the world | earn her place in the world | be knighted for her valor | become famous and loved in all the known world | become infamous and feared in all the known world}.";
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
				0,
				5
			],
			RangedSkill = [
				15,
				25
			],
			MeleeDefense = [
				-5,
				3
			],
			RangedDefense = [
				2,
				5
			],
			Initiative = [
				-2,
				3
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
			items.equip(this.new("scripts/items/weapons/hunting_bow"));
			items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/crossbow"));
			items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/pike"));
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
				1,
				"nasal_helmet"
			],
			[
				1,
				"padded_nasal_helmet"
			],
			[
				1,
				"nasal_helmet_with_mail"
			],
			[
				1,
				"mail_coif"
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
				2,
				""
			]
		]));
	}

});

