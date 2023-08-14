this.lumberjack_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.lumberjack";
		this.m.Name = "Lumberjack";
		this.m.Icon = "ui/backgrounds/background_04.png";
		this.m.BackgroundDescription = "Lumberjacks are used to hard physical labor. And axes.";
		this.m.GoodEnding = "%name% the burly lumberjack eventually left the company to return to the woods. He started a woodcutting business and operates every day of the year. Luckily, timing was on his side: the nobility have recently really gotten \'into\' cabins and are paying out crowns left and right to anyone who can build them.";
		this.m.BadEnding = "%name% the lumberjack had enough of the sellsword\'s life and returned to woodcutting. Last you heard, he was involved in a tree-falling accident and his body could have been rolled up like a rug the bones were so thoroughly squashed.";
		this.m.HiringCost = 100;
		this.m.DailyCost = 13;
		this.m.Excluded = [
			"trait.weasel",
			"trait.hate_undead",
			"trait.night_blind",
			"trait.ailing",
			"trait.clubfooted",
			"trait.asthmatic",
			"trait.clumsy",
			"trait.fat",
			"trait.craven",
			"trait.fainthearted",
			"trait.bright",
			"trait.bleeder",
			"trait.fragile",
			"trait.tiny"
		];
		this.m.Titles = [
			"the Sturdy",
			"the Axe",
			"the Woodsman"
		];
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.NeutralMax;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.BackgroundType = this.Const.BackgroundType.Lowborn | this.Const.BackgroundType.Ranger | this.Const.BackgroundType.Combat;
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[1];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[2];
		this.m.Modifiers.ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[1];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[1];
		this.m.Modifiers.Terrain = [
			0.0,
			0.0,
			0.0,
			0.0,
			0.0,
			0.05,
			0.05,
			0.05,
			0.05,
			0.0,
			0.0,
			0.0,
			0.0,
			0.0,
			0.0,
			0.0,
			0.0,
			0.0,
			0.0
		];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.AxeTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.ThrowingTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [
				this.Const.Perks.AgileTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.SturdyTree,
				this.Const.Perks.FitTree
			],
			Enemy = [],
			Class = [
				this.Const.Perks.WoodaxeClassTree
			],
			Magic = []
		};
	}

	function onBuildDescription()
	{
		return "A lumberjack, %fullname% {spent most of his days in the woods, chopping down trees | earned his crowns by chopping trees for firewood | was never seen without either axe or wood on his shoulder | always was a quiet man that prefered the serenity of the woods to the company of people | was eyed by many a young woman for his good stature and strong hands | always used to day-dream he was a knight, swinging his axe not against trees but orcs and trolls}. {A large and sturdy man, working outside came easily to him | He loved his collection of axes, having named every single one after a woman he once knew | He worked hard every day, but it was honest work | Alone in the woods he would talk to the trees and have them tell him which ones would give the best wood | Few men could swing an axe like he did, having a tree fall just like he wanted it | With his large and sturdy build he could carry on his back what other people would be crushed by}. {Like most people, he took on the profession of his father. Yet over the years, it dawned on him that he wanted to see more from the world than the same woods every day. After thinking long and hard, he made up his mind to | His life collapsed on him as his beloved wife died in childbirth. With everything taken from him, he became more and more reclusive, and not even the woods could bring him peace anymore. Just wanting to get away, he decided to | Returning from the woods one day, he saw smoke from afar. His village was burning, the people slaughtered or taken. His home destroyed. Full of anger he set off and decided to | Over time, strange creatures began to appear in the woods. One villager after the other disappared, some moved away. After a long night with no sleep, he decided it was time for him to leave as well. With nothing to live off, he was desperate to | Curious to all the villagers, it seemed %name% lost his interest in the woods with time, speaking of going away every more often if he spoke at all. One fateful day, they saw him volunteer to | One fateful day a tree he fell slew a deer. %name% did not want to waste it and so took it home, only to find himself accused of poaching. Before a sentence was cast he decided to leave the village in haste and attempt to} join a travelling mercenary company.";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				10,
				10
			],
			Bravery = [
				0,
				5
			],
			Stamina = [
				10,
				15
			],
			MeleeSkill = [
				6,
				8
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				-5,
				0
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 3);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/hand_axe"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/hatchet"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/legend_saw"));
		}

		items.equip(this.Const.World.Common.pickArmor([
			[
				2,
				"padded_surcoat"
			],
			[
				1,
				"leather_tunic"
			],
			[
				1,
				"linen_tunic",
				6
			]
		]));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				""
			],
			[
				1,
				"hood"
			]
		]));
	}

});

