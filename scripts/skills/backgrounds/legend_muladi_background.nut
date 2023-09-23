this.legend_muladi_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_muladi";
		this.m.Name = "Muladí";
		this.m.Icon = "ui/backgrounds/background_muladi.png";
		this.m.BackgroundDescription = "A muladi is accustomed to the south, although not entirely accepted by the locals.";
		this.m.GoodEnding = "Ever an outcast, %name% returned home and used the crowns gained from their adventures to buy a home far away from those who scorned them in the past. The link between nature and %name% strengthened, acting a safe safe haven for those wronged or on the run.";
		this.m.BadEnding = "Living on the divide was a dangerous business, in attempting to return home they were driven out by northern militia on a border town with the desert. Alone, hungry and desperate. %name% was easy prey for the wild animals they once called kin.";
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
			"trait.seductive",
			"trait.fear_beasts",
			"trait.hate_beasts"
		];
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.BackgroundType = this.Const.BackgroundType.Lowborn | this.Const.BackgroundType.Ranger | this.Const.BackgroundType.ExpertHunter;
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
			0.025,
			0.0,
			0.025,
			0.0,
			0.0,
			0.0,
			0.0,
			0.01,
			0.0,
			0.0,
			0.0,
			0.0,
			0.0,
			0.01,
			0.0,
			0.025,
			0.025
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
				this.Const.Perks.NomadsTree
			],
			Class = [
				this.Const.Perks.ShortbowClassTree,
				this.Const.Perks.HoundmasterClassTree
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
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setTitle("the Muladí");
	}

	function onBuildDescription()
	{
		return "{}";
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

	function onBuildDescription()
	{
		return "{Despite the clothing and language of the south, %name% has always been regarded with contempt by their fellow southerners who prefer to name them \'outsider\' than anything else. | Life on the edge of society taught %name% about a lot of things - self reliance, animal kinship, and how to effectively fell a man at 30 paces with an arrow. }{Once a northerner, %name% dresses, speaks and acts in all southern customs. Much to the irritation of some of the local inhabitants. | %name%\'s presence is seen as a threat by some and an abomination by others. | %name% assures you that this way of life is not as painful as it may seem, despite the occasional insults from the locals. }{%name% stands out to everyone around them - at a glance they appear to be your typical nomad wandering the streets or moving across the dunes, but on closer inspection many will recognise their face has not been gilded by the sun and is missing the darker hair common in this region.  | %name% is a self appointed outcast, or perhaps a victim of shifting territories and warring cultures. }{%name%\'s existence is quite simple - life at the rim of society allows them to appreciate the more natural things in life. Nature, landscapes and the occasional holy war far off on the horizon. | The aggression and violence of humanity is what led %name% to adopt more of the southern customs, perhaps feeling that trading multiple tyrants for a singular one would be a favourable transaction. | %name% remarks they moved only for the food, but you suspect they came for a little bit more than that.}";
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
			else if (r <= 80)
			{
				items.equip(this.new("scripts/items/weapons/legend_sling"));
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

		items.equip(this.new("scripts/items/accessory/wardog_item"));
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"oriental/nomad_robe"
			],
			[
				1,
				"oriental/thick_nomad_robe"
			],
			[
				1,
				"oriental/cloth_sash"
			]
		]));
		local helm = this.Const.World.Common.pickHelmet([
			[
				1,
				"oriental/southern_head_wrap"
			],
			[
				1,
				"oriental/leather_head_wrap"
			],
			[
				1,
				"oriental/nomad_head_wrap"
			]
		]);
		items.equip(helm);
	}

});

