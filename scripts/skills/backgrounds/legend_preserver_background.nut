this.legend_preserver_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_preserver";
		this.m.Name = "Preserver";
		this.m.Icon = "ui/backgrounds/background_necromancer_2.png";
		this.m.BackgroundDescription = "Preservers practice the art of anatomy over ressurection - taking a more scientific approach to how dead things work.";
		this.m.GoodEnding = "As time went on, %name% found work not too far from where they once grew up. The local village needed a new herbalist to heal the sick and tend to the wounded coming back from the wars. %name% occasionally recognised some of the casualties that ended up in her hut as a few of those who got away in the past. Thankfully they did not have the same attention to detail.";
		this.m.BadEnding = "%name% continued to move with the company for some time. As time went on their interest in the sciences around the dead shifted more from the living and further towards the dead. Living in a graveyard with a few puppets for company, %name% was eventually subdued and burnt at the stake by a mercenary company sent to clear the graveyard.";
		this.m.HiringCost = 1704124416;
		this.m.DailyCost = 0;
		this.m.Excluded = [
			"trait.weasel",
			"trait.hate_undead",
			"trait.fear_undead",
			"trait.clubfooted",
			"trait.brute",
			"trait.gluttonous",
			"trait.disloyal",
			"trait.cocky",
			"trait.dumb",
			"trait.iron_lungs",
			"trait.craven",
			"trait.aggressive",
			"trait.greedy",
			"trait.bloodthirsty"
		];
		this.m.Titles = [
			"the Morbid",
			"the Surgeon",
			"the Butcher",
			"the Fleshshaper"
		];
		this.m.Faces = this.Const.Faces.AllWhiteFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Ethnicity = 0;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Kind;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.BackgroundType = this.Const.BackgroundType.OffendedByViolence | this.Const.BackgroundType.Ranger | this.Const.BackgroundType.Druid | this.Const.BackgroundType.Female;
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[2];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[1];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[1];
		this.m.Modifiers.MedConsumption = this.Const.LegendMod.ResourceModifiers.MedConsumption[3];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[3];
		this.m.Modifiers.Terrain = [
			0.0,
			0.0,
			0.0,
			0.0,
			0.0,
			0.1,
			0.1,
			0.1,
			0.1,
			0.0,
			0.0,
			0.0,
			0.02,
			0.02,
			0.02,
			0.0,
			0.0,
			0.0,
			0.0
		];

		if (!this.LegendsMod.Configs().LegendMagicEnabled())
		{
			this.m.CustomPerkTree = [
				[
					this.Const.Perks.PerkDefs.LegendSpecialistSlingSkill,
					this.Const.Perks.PerkDefs.NineLives,
					this.Const.Perks.PerkDefs.CripplingStrikes,
					this.Const.Perks.PerkDefs.BagsAndBelts,
					this.Const.Perks.PerkDefs.LegendSpecialistScytheSkill,
					this.Const.Perks.PerkDefs.LegendSpecialistSickleSkill,
					this.Const.Perks.PerkDefs.Student,
					this.Const.Perks.PerkDefs.Recover,
					this.Const.Perks.PerkDefs.LegendMedPackages,
					this.Const.Perks.PerkDefs.LegendAlert
				],
				[
					this.Const.Perks.PerkDefs.Dodge,
					this.Const.Perks.PerkDefs.HoldOut,
					this.Const.Perks.PerkDefs.FortifiedMind,
					this.Const.Perks.PerkDefs.Gifted,
					this.Const.Perks.PerkDefs.Bullseye,
					this.Const.Perks.PerkDefs.LegendGatherer,
					this.Const.Perks.PerkDefs.LegendPrepareBleed,
					this.Const.Perks.PerkDefs.LegendPrepareGraze
				],
				[
					this.Const.Perks.PerkDefs.Backstabber,
					this.Const.Perks.PerkDefs.Debilitate,
					this.Const.Perks.PerkDefs.LegendFavouredEnemyCaravan,
					this.Const.Perks.PerkDefs.Lookout,
					this.Const.Perks.PerkDefs.LegendSpecialistScytheDamage,
					this.Const.Perks.PerkDefs.RallyTheTroops,
					this.Const.Perks.PerkDefs.InspiringPresence,
					this.Const.Perks.PerkDefs.LegendTrueBeliever,
					this.Const.Perks.PerkDefs.LegendSpecialistSickleDamage,
					this.Const.Perks.PerkDefs.LegendSpecStaffSkill,
					this.Const.Perks.PerkDefs.LegendBloodbath
				],
				[
					this.Const.Perks.PerkDefs.SpecSword,
					this.Const.Perks.PerkDefs.SpecCleaver,
					this.Const.Perks.PerkDefs.LegendSpecialistSlingDamage,
					this.Const.Perks.PerkDefs.LegendMasteryStaves,
					this.Const.Perks.PerkDefs.LegendPotionBrewer,
					this.Const.Perks.PerkDefs.SpecPolearm,
					this.Const.Perks.PerkDefs.LegendMasterySlings,
					this.Const.Perks.PerkDefs.LegendPoisonImmunity,
					this.Const.Perks.PerkDefs.LegendSpecPoison,
					this.Const.Perks.PerkDefs.LegendSpecBandage
				],
				[
					this.Const.Perks.PerkDefs.Nimble,
					this.Const.Perks.PerkDefs.LegendSpecStaffStun,
					this.Const.Perks.PerkDefs.LegendFavouredEnemyGhoul,
					this.Const.Perks.PerkDefs.LegendBlendIn,
					this.Const.Perks.PerkDefs.LegendMindOverBody,
					this.Const.Perks.PerkDefs.LegendMedIngredients,
					this.Const.Perks.PerkDefs.LegendConservation,
					this.Const.Perks.PerkDefs.LegendSlaughter
				],
				[
					this.Const.Perks.PerkDefs.LegendClarity,
					this.Const.Perks.PerkDefs.LegendReclamation,
					this.Const.Perks.PerkDefs.LegendHerbcraft,
					this.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
					this.Const.Perks.PerkDefs.Rebound
				],
				[
					this.Const.Perks.PerkDefs.Fearsome,
					this.Const.Perks.PerkDefs.PerfectFocus,
					this.Const.Perks.PerkDefs.LegendFreedomOfMovement,
					this.Const.Perks.PerkDefs.LegendBalance,
					this.Const.Perks.PerkDefs.Inspire,
					this.Const.Perks.PerkDefs.LegendFieldTriage
				],
				[],
				[],
				[],
				[]
			];
		}
	}

	function onBuildDescription()
	{
		return "{After being raised as a peasant girl in a backwater town, %name% took a shine to gathering herbs with their mother. | %name% did not get far in later life, often failing to gather what was asked of her by local herbalists. | %name% became more interested in how to kill rather than heal, which lead to them being run out of the village as a young girl after exhuming a fresh grave. | %name% wandered far and wide, often around %randomtown% until they had an outbreak of living dead from the nearby graveyard. | After being led into the forest and left to die by her parents, %name% found a local Hexe hiding amonst the ruins of an old hut. The tale goes that %name% slew the hag by pushing her into her own boiling pot. Like anyone would believe that.} {Regardless of their path, all roads led to %name% discovering a lone necromancer on the road. Who offered to take her in and teach her how to reach her full potential.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-5,
				-5
			],
			Bravery = [
				7,
				13
			],
			Stamina = [
				5,
				0
			],
			MeleeSkill = [
				0,
				0
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
				10,
				20
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Bravery] = 1;
		talents[this.Const.Attributes.Initiative] = 1;
		this.getContainer().getActor().fillTalentValues(1, true);
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				3,
				"necromancer_hat"
			],
			[
				2,
				"dark_cowl"
			],
			[
				1,
				""
			],
			[
				4,
				"witchhunter_hat"
			]
		]));
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"thick_dark_tunic"
			]
		]));
		local r;
		r = this.Math.rand(0, 8);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/legend_scythe"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/legend_staff"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/legend_sickle"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/battle_whip"));
		}
		else if (r >= 4)
		{
			items.equip(this.new("scripts/items/weapons/legend_cat_o_nine_tails"));
		}
	}

});

