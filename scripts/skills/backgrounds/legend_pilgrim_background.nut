this.legend_pilgrim_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_pilgrim";
		this.m.Name = "Pilgrim";
		this.m.Icon = "ui/backgrounds/background_54.png";
		this.m.BackgroundDescription = "Dirty and tired, these disciples of the old gods look for clarity and power in their teachings.";
		this.m.GoodEnding = "%name% began their journey with you as a victim or circamstance, at oods with the rest of the world in their newfound prediciment. Although they were not paid much %name% continued to spread your teaches to all who would listen. Seasons from then they would join the same holy order after it\'s monastary was burnt down, setting out with like minded companions as a crusader.";
		this.m.BadEnding = "With your retirement from the company, %name% set out to spread the word of your teachings. Many did not take kindly to their words and often found themselves driven out of towns and into the wilderness. After one such instance %name% took shelter in an abandoned crypt, which quickly turned out to not be abandoned at all...";
		this.m.HiringCost = 0;
		this.m.DailyCost = 5;
		this.m.Titles = [
			"the Fanatic",
			"the Pious",
			"the Holy",
			"the Martyr",
			"the Devout",
			"the Wanderer",
			"the Believer",
			"the Faithful",
			"the Zealous"
		];
		this.m.Excluded = [
			"trait.gluttonous",
			"trait.lucky",
			"trait.cocky",
			"trait.fat",
			"trait.dastard",
			"trait.insecure",
			"trait.fearless",
			"trait.brave",
			"trait.fear_undead",
			"trait.drunkard",
			"trait.determined",
			"trait.greedy",
			"trait.athletic",
			"trait.hate_beasts",
			"trait.hate_greenskins",
			"trait.hate_nobles",
			"trait.slack"
		];
		this.m.IsGuaranteed = [
			"hate_undead_trait"
		];
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.BackgroundType = this.Const.BackgroundType.Combat | this.Const.BackgroundType.Crusader | this.Const.BackgroundType.OffendedByViolence;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Merciless;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Good;
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[1];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[1];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[1];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[1];
		this.m.Modifiers.Terrain = [
			0.0,
			0.0,
			0.01,
			0.0,
			0.02,
			0.02,
			0.02,
			0.02,
			0.02,
			0.01,
			0.0,
			0.01,
			0.0,
			0.02,
			0.02,
			0.02,
			0.0,
			0.0,
			0.0
		];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.HammerTree,
				this.Const.Perks.MaceTree,
				this.Const.Perks.ShieldTree,
				this.Const.Perks.SlingTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [
				this.Const.Perks.FitTree,
				this.Const.Perks.SturdyTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.IndestructibleTree
			],
			Enemy = [
				this.Const.Perks.ZombieTree,
				this.Const.Perks.SkeletonTree
			],
			Class = [
				this.Const.Perks.FaithClassTree
			],
			Magic = []
		};
	}

	function getTooltip()
	{
		local ret = this.character_background.getTooltip();

		if (("State" in this.World) && this.World.State != null && this.World.Assets.getOrigin().getID() == "scenario.legends_crusader")
		{
			ret.push({
				id = 19,
				type = "text",
				icon = "ui/icons/special.png",
				text = "No morale check triggered for non-pilgrim allies upon dying"
			});
		}

		return ret;
	}

	function onBuildDescription()
	{
		if (this.isBackgroundType(this.Const.BackgroundType.Female))
		{
			return "{%name% has walked long and hard to almost all the holy sites. | As a shepard\'s wife of a rural farm out in the hinterlands, %name% often dealt with trepassers. One day a budding nceromancer and his three apprentices took the farm for themselves. Her husband was slain and still wanders someplace between the world of the living and the dead. Ever since %name% has been looking for a way to avenge her husband\'s death and purge the land of the undead. | A fight with an innkeeper over the rates that they were charging for beds quickly escalated into a brawl. After the the night watch broke up and took all of %name%\'s crowns for \'services\', they did what they could to find safe passage to their last designation. Thats where you come in. | A northerner with a hefty and well known family name marked %name% as a target the moment they set foot on the road alone with little more than a staff and good intentions. Bandits quickly descended upon them. Without passes and forms to prove their status as a pilgrim %name% had all but given up hope of ever getting out on the road again. | %name% talks at great lengths about their vocation as a missionary and woman of god. However a large stash of valubles they accumulate leads to to believe something more sinister is afoot.}";
		}
		else
		{
			return "{%name% has walked long and hard to almost all the holy sites. | As a farmhand in an orchard around the border towns of the south and north %name% lived a peaceful life until a throng of anicent dead swept through the village and burnt everything to the ground. Ever since a fire has burned in his heart to clean the land of the dead that still walk the earth. | Once a billman in service to a local lord, %name% quickly fell out of service when said lord was drowned in the river by an angry mob. Now with a target painted on his back, %name% tries to blend in to the crowd as a pilgrim. They say they always wanted to give \'this holy lark\' a \'fair shake\' anyway. | Born a bastard to a local lord, %name% lived most of their life in the countryside as a farmhand. One day a messanger arrived, escorted by a dozen or so footmen \'requesting\' that they come pay respects to a new lord of the land. Sensing a trap %name% made a break for it and spends their time far away from the nobility as possible. | %name% is lucky to be alive, if the tales are true then they are one of the few survivors of a small hamlet in the north swarming with undead. A local necromancer as since seized the hamlet for themselves. Wanting to do more and reclaim their home, he now searches for the wisdom of the old gods to fight back.}";
		}
	}

	function setGender( _gender = -1 )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() == "Disabled" ? 0 : ::Math.rand(0, 19);

		if (_gender != 1)
		{
			return;
		}

		this.m.Faces = this.Const.Faces.AllWhiteFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.addBackgroundType(this.Const.BackgroundType.Female);
		this.m.GoodEnding = "%name% began their journey with you as a victim or circamstance, at oods with the rest of the world in their newfound prediciment. Although they were not paid much %name% continued to spread your teaches to all who would listen. Seasons from then they would join the same holy order after it\'s monastary was burnt down, setting out with like minded companions as a crusader.";
		this.m.BadEnding = "With your retirement from the company, %name% set out to spread the word of your teachings. Many did not take kindly to their words and often found themselves driven out of towns and into the wilderness. After one such instance %name% took shelter in an abandoned crypt, which quickly turned out to not be abandoned at all...";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-8,
				8
			],
			Bravery = [
				10,
				20
			],
			Stamina = [
				-8,
				8
			],
			MeleeSkill = [
				-8,
				8
			],
			RangedSkill = [
				-8,
				8
			],
			MeleeDefense = [
				-5,
				5
			],
			RangedDefense = [
				-5,
				5
			],
			Initiative = [
				-6,
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

		if (this.Math.rand(1, 100) <= 66)
		{
			local body = actor.getSprite("body");
			local tattoo_body = actor.getSprite("tattoo_body");
			tattoo_body.setBrush("scar_01_" + body.getBrush().Name);
			tattoo_body.Color = body.Color;
			tattoo_body.Saturation = body.Saturation;
			tattoo_body.Visible = true;
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		local weapons = [
			"weapons/legend_staff",
			"weapons/legend_tipstaff"
		];
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"leather_tunic"
			],
			[
				1,
				"tattered_sackcloth"
			],
			[
				1,
				"padded_surcoat"
			],
			[
				1,
				"gambeson"
			],
			[
				1,
				"linen_tunic"
			]
		]));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"aketon_cap"
			],
			[
				1,
				"full_aketon_cap"
			],
			[
				1,
				"open_leather_cap"
			],
			[
				1,
				"full_leather_cap"
			],
			[
				1,
				"straw_hat"
			]
		]));
	}

	function onUpdate( _properties )
	{
	}

});

