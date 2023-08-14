this.poacher_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.poacher";
		this.m.Name = "Poacher";
		this.m.Icon = "ui/backgrounds/background_21.png";
		this.m.BackgroundDescription = "Poachers tend to have some skill in using bow and arrow to hunt down rabbits and the like.";
		this.m.GoodEnding = "%name%, former poacher, eventually saved enough money to leave the %companyname%. You learned he found a bit of mountain land and works it for a local nobleman. Ironically, his job is to hunt down poachers.";
		this.m.BadEnding = "No longer seeing the point in risking his life for so few crowns, %name% the former poacher put down the sellsword\'s life and returned to unlawfully hunting deer in the woods. A nobleman once offered you a good satchel of crowns to specifically hunt the man down. You declined the offer, but the writing was on the wall: his days are numbered.";
		this.m.HiringCost = 100;
		this.m.DailyCost = 10;
		this.m.Excluded = [
			"trait.hate_undead",
			"trait.night_blind",
			"trait.clubfooted",
			"trait.short_sighted",
			"trait.loyal",
			"trait.fat",
			"trait.fearless",
			"trait.brave",
			"trait.bright",
			"trait.seductive"
		];
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.BackgroundType = this.Const.BackgroundType.Lowborn | this.Const.BackgroundType.Outlaw | this.Const.BackgroundType.Ranger;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Notorious;
		this.m.Modifiers.Ammo = this.Const.LegendMod.ResourceModifiers.Ammo[1];
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[2];
		this.m.Modifiers.Fletching = this.Const.LegendMod.ResourceModifiers.Fletching[1];
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[2];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[2];
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
			0.01,
			0.01,
			0.01,
			0.0,
			0.0,
			0.0,
			0.0
		];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.BowTree,
				this.Const.Perks.SlingTree,
				this.Const.Perks.DaggerTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [
				this.Const.Perks.CalmTree,
				this.Const.Perks.FastTree,
				this.Const.Perks.DeviousTree,
				this.Const.Perks.AgileTree
			],
			Enemy = [
				this.Const.Perks.DirewolfTree,
				this.Const.Perks.SpiderTree,
				this.Const.Perks.GoblinTree
			],
			Class = [
				this.Const.Perks.ShortbowClassTree
			],
			Magic = []
		};
	}

	function setGender( _gender = -1 )
	{
		if (_gender == -1)
		{
			_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() == "Disabled" ? 0 : ::Math.rand(0, 1);
		}

		if (_gender != 1)
		{
			return;
		}

		this.m.Faces = this.Const.Faces.PrettyFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.FemaleSkinny;
		this.addBackgroundType(this.Const.BackgroundType.Female);
		this.m.GoodEnding = "%name%, former poacher, eventually saved enough money to leave the %companyname%. You learned she found a bit of mountain land and works it for a local nobleman. Ironically, her job is to hunt down poachers.";
		this.m.BadEnding = "No longer seeing the point in risking her life for so few crowns, %name% the former poacher put down the sellsword\'s life and returned to unlawfully hunting deer in the woods. A nobleman once offered you a good satchel of crowns to specifically hunt the woman down. You declined the offer, but the writing was on the wall: her days are numbered.";
	}

	function onBuildDescription()
	{
		return "{Interested in the thrill of the hunt, | Looking to support a family, | With a grumbling stomach, | After a long and hard winter without a stock of food,} %name% {set off into the woods in chase of deer | sought wildlife to which, if skittishness is any indication, the hunter may or may not have had proper claim | ate a fill of all manner of woodland creatures, a well-used bow yoked across shoulders indicating the means to the meals | took to the woods to hunt game with bow and spear}. Hailing from %townname%, %name% {was, as a poacher, the hunter and the hunted | needed to feed the children back home | sought to support oneself, one\'s own hide, and one\'s ever-growling stomach | was poaching, an act of rebellion against the order of things as much as a means to a full belly}. {Fearful these pursuits would attract bounty hunters or lawmen, decided to settle on life as a bow for hire. | Tired of working so hard just to put food on the table, buying a meal with a sellsword\'s pay just seemed so much easier. | After a bad hunt led to a long stay in a lord\'s dungeon, the poacher would rather put neck on the line as a mercenary now than in the noose as a poacher. | Years of lonely hunting wore on. Although life as a mercenary is exceedingly dangerous, it seems better to die with company than alone. | With a mother pleading for a change of ways, lest the whole family pay for the crimes. the poacher stands here now, a testament to who won the argument.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				-5,
				5
			],
			Stamina = [
				3,
				0
			],
			MeleeSkill = [
				2,
				0
			],
			RangedSkill = [
				15,
				7
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
				0,
				4
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

		if (this.Const.DLC.Wildmen)
		{
			r = this.Math.rand(1, 100);

			if (r <= 50)
			{
				items.equip(this.new("scripts/items/weapons/short_bow"));
				items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
			}
			else if (r <= 70)
			{
				items.equip(this.new("scripts/items/weapons/legend_sling"));
			}
			else if (r <= 85)
			{
				items.equip(this.new("scripts/items/weapons/legend_slingshot"));
			}
			else
			{
				items.equip(this.new("scripts/items/weapons/wonky_bow"));
				items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
			}
		}
		else
		{
			if (this.Math.rand(1, 100) <= 75)
			{
				items.equip(this.new("scripts/items/weapons/short_bow"));
			}
			else
			{
				items.equip(this.new("scripts/items/weapons/wonky_bow"));
			}

			items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.addToBag(this.new("scripts/items/weapons/knife"));
		}
		else if (r == 1)
		{
			items.addToBag(this.new("scripts/items/weapons/militia_spear"));
		}

		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"leather_tunic"
			],
			[
				1,
				"leather_wraps"
			],
			[
				1,
				"ragged_surcoat"
			]
		]));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"hood"
			]
		]));
	}

});

