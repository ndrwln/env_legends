this.wildman_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {
		Tattoo = 0
	},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.wildman";
		this.m.Name = "Wildman";
		this.m.Icon = "ui/backgrounds/background_31.png";
		this.m.BackgroundDescription = "Wildmen are used to the hard life of the wild where only the strong prevail. They are less used to the life of cities, where the astute and deceitful rule.";
		this.m.GoodEnding = "While the %companyname% visited a town for rest and recuperation, a local princess took a shine to %name% the wildman. He was \'purchased\' for a large sum of gold and given to the noblewoman. You went and visited the man recently. For dinner, he sat at a kingly table, grinning goofily and mimicking the nobles around him as best he could. His new and inexplicable wife adored him, and him her. When you said your goodbyes, he offered you a heavy golden crown off the top of his head. It weighed heavy with traditions and ancient histories. You said it\'d be best if he kept it. The wildman shrugged and walked off, spinning the circlet around a finger.";
		this.m.BadEnding = "%name% the wildman stayed with the fragmenting %companyname% for a time and then, just like that, he was gone. The company went out looking for him in a forest, eventually finding some sort of crude note: an enormous pile of crowns next to a dirt-drawing of the %companyname% and some of its members, all of them being hugged by a big, literal stick figure with a goofy smile on its face. There was also an offering of a dead, half-eaten rabbit.";
		this.m.HiringCost = 200;
		this.m.DailyCost = 18;
		this.m.Excluded = [
			"trait.weasel",
			"trait.teamplayer",
			"trait.fear_beasts",
			"trait.fear_nobles",
			"trait.hate_undead",
			"trait.paranoid",
			"trait.night_blind",
			"trait.ailing",
			"trait.clubfooted",
			"trait.fat",
			"trait.tiny",
			"trait.gluttonous",
			"trait.pessimist",
			"trait.optimist",
			"trait.short_sighted",
			"trait.dexterous",
			"trait.insecure",
			"trait.hesitant",
			"trait.asthmatic",
			"trait.greedy",
			"trait.fragile",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.bright",
			"trait.cocky",
			"trait.dastard",
			"trait.drunkard",
			"trait.frail",
			"trait.predictable"
		];
		this.m.Titles = [
			"the Savage",
			"the Outcast",
			"the Wildman",
			"the Feral",
			"the Wild",
			"the Barbarian"
		];
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.WildMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.Wild;
		this.m.BeardChance = 100;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Level = this.Math.rand(1, 2);
		this.m.BackgroundType = this.Const.BackgroundType.Combat | this.Const.BackgroundType.Outlaw | this.Const.BackgroundType.Druid | this.Const.BackgroundType.Ranger | this.Const.BackgroundType.ExpertHunter;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Merciless;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Good;
		this.m.Modifiers.MedConsumption = this.Const.LegendMod.ResourceModifiers.MedConsumption[1];
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[2];
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[1];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[3];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[1];
		this.m.Modifiers.Terrain = [
			0.0,
			0.0,
			0.0,
			0.025,
			0.025,
			0.0,
			0.0,
			0.0,
			0.0,
			0.025,
			0.0,
			0.0,
			0.025,
			0.025,
			0.025,
			0.0,
			0.0,
			0.0,
			0.0
		];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.MaceTree,
				this.Const.Perks.AxeTree,
				this.Const.Perks.ThrowingTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [
				this.Const.Perks.SturdyTree,
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.FitTree
			],
			Enemy = [
				this.Const.Perks.OrcTree,
				this.Const.Perks.GoblinTree
			],
			Class = [
				this.Const.Perks.FistsClassTree
			],
			Magic = []
		};
	}

	function getTooltip()
	{
		local ret = this.character_background.getTooltip();
		ret.push({
			id = 15,
			type = "text",
			icon = "ui/icons/xp_received.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] Experience Gain"
		});
		return ret;
	}

	function onBuildDescription()
	{
		return "{For some, the wild is a refuge. | It is said that man is born with the wilderness in him, and that he does wrong by turning his back on it. | Civilization is a stain, one prolonged arming of every next-generation to better battle the ultimate enemy: Mother Nature herself. | In a time of war, it\'s not surprising that many once again seek refuge in the wild. | Some people flee from town to town. Others stop in between, disappearing into the tranquil forests.} {%name% once found a safe register amongst the trees, but that time is over. | Once a mysterious figure to hunters - the famed masskewatsthat - %name% now returns to civilization for reasons unknown. | %name%\'s got the hands of a blacksmith, but the hygiene of a pigsty. | Maybe it was spurned love, or maybe just war, but %name% has spent the last decade far from the rest of mankind. | Possibly a poacher who settled where he hunted, %name%\'s lived amongst the trees for untold years. | With cleverly stitched garb, %name%\'s atavistic appearance perhaps belies a past as a tailor or tanner.} {There is an obvious language barrier with the wildman, but for some reason he seems very willing to fight. Let\'s hope his newfound \'calling\' doesn\'t have a darker purpose behind it. | Colorful and permanent ritual rites circle about his body. When asked why he wishes to join a band of mercenaries, he hoots and, with a crooked finger, replicates one of his fleshen arts across the sky. | Wounds, old and fresh, dot his already mottled body. And they are not superficial - this man had been fighting something fierce in the wild. | One has to wonder if the calamities which chased him into the forests have come to chase him back out. | Judging by his wild grunting, it\'s doubtful he\'s here to rejoin civilization. | Years as a recluse haven\'t made the man forget what a few crowns can get you. The question is, why did he come back? | He has the strength to wrestle a boar - and his many scars makes you wonder if perhaps he did.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				13,
				8
			],
			Bravery = [
				12,
				10
			],
			Stamina = [
				18,
				23
			],
			MeleeSkill = [
				7,
				10
			],
			RangedSkill = [
				-5,
				0
			],
			MeleeDefense = [
				-5,
				0
			],
			RangedDefense = [
				-5,
				-5
			],
			Initiative = [
				5,
				12
			]
		};
		return c;
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local dirt = actor.getSprite("dirt");
		dirt.Visible = true;
		this.m.Tattoo = this.Math.rand(0, 1);
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");
		local body = actor.getSprite("body");
		tattoo_body.setBrush((this.m.Tattoo == 0 ? "warpaint_01_" : "scar_02_") + body.getBrush().Name);
		tattoo_body.Visible = true;
		tattoo_head.setBrush(this.m.Tattoo == 0 ? "warpaint_01_head" : "scar_02_head");
		tattoo_head.Visible = true;
	}

	function updateAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		if (tattoo_body.HasBrush)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush((this.m.Tattoo == 0 ? "warpaint_01_" : "scar_02_") + body.getBrush().Name);
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

		if (this.Const.DLC.Unhold)
		{
			r = this.Math.rand(0, 7);

			if (r == 0)
			{
				items.equip(this.new("scripts/items/weapons/hatchet"));
			}
			else if (r == 1)
			{
				items.equip(this.new("scripts/items/weapons/wooden_stick"));
			}
			else if (r == 2)
			{
				items.equip(this.new("scripts/items/weapons/greenskins/orc_metal_club"));
			}
			else if (r == 3)
			{
				items.equip(this.new("scripts/items/weapons/greenskins/orc_wooden_club"));
			}
			else if (r == 4)
			{
				items.equip(this.new("scripts/items/weapons/boar_spear"));
			}
			else if (r == 5)
			{
				items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
			}
			else if (r == 6)
			{
				items.equip(this.new("scripts/items/weapons/two_handed_wooden_hammer"));
			}
			else if (r == 7)
			{
				items.equip(this.new("scripts/items/weapons/two_handed_wooden_flail"));
			}
		}
		else
		{
			r = this.Math.rand(0, 6);

			if (r == 0)
			{
				items.equip(this.new("scripts/items/weapons/hatchet"));
			}
			else if (r == 1)
			{
				items.equip(this.new("scripts/items/weapons/wooden_stick"));
			}
			else if (r == 2)
			{
				items.equip(this.new("scripts/items/weapons/greenskins/orc_metal_club"));
			}
			else if (r == 3)
			{
				items.equip(this.new("scripts/items/weapons/greenskins/orc_wooden_club"));
			}
			else if (r == 4)
			{
				items.equip(this.new("scripts/items/weapons/boar_spear"));
			}
			else if (r == 5)
			{
				items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
			}
		}

		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"leather_wraps"
			],
			[
				1,
				"legend_rabble_fur"
			]
		]));
	}

	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.XPGainMult *= 0.85;
	}

	function onSerialize( _out )
	{
		this.character_background.onSerialize(_out);
		_out.writeU8(this.m.Tattoo);
	}

	function onDeserialize( _in )
	{
		this.character_background.onDeserialize(_in);
		this.m.Tattoo = _in.readU8();
	}

});

