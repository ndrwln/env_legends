this.mage_legend_mage_commander_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.Name = "Mage";
		this.m.ID = "background.mage_legend_commander_mage";
		this.m.Icon = "ui/backgrounds/seer_02.png";
		this.m.HiringCost = 250;
		this.m.DailyCost = 0;
		this.m.Excluded = [
			"trait.athletic",
			"trait.bloodthirsty",
			"trait.brute",
			"trait.dexterous",
			"trait.huge",
			"trait.tough",
			"trait.disloyal",
			"trait.greedy",
			"trait.loyal",
			"trait.dumb"
		];
		this.m.Titles = [
			"the Mage",
			"the Wizard",
			"the Arcane",
			"the Master"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.m.BackgroundType = this.Const.BackgroundType.Female | this.Const.BackgroundType.Untalented | this.Const.BackgroundType.Educated;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Good;
		this.m.Level = 3;
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[3];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[2];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[2];
		this.m.Modifiers.MedConsumption = this.Const.LegendMod.ResourceModifiers.MedConsumption[3];
		this.setMagicPerks();
	}

	function setMagicPerks()
	{
		this.m.CustomPerkTree = [
			[
				this.Const.Perks.PerkDefs.MageLegendMagicMissile,
				this.Const.Perks.PerkDefs.MageLegendMagicDaze,
				this.Const.Perks.PerkDefs.MageLegendMagicImbue,
				this.Const.Perks.PerkDefs.FastAdaption,
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.Student,
				this.Const.Perks.PerkDefs.Recover
			],
			[
				this.Const.Perks.PerkDefs.MageLegendMagicBurningHands,
				this.Const.Perks.PerkDefs.LegendSummonCat,
				this.Const.Perks.PerkDefs.CoupDeGrace,
				this.Const.Perks.PerkDefs.Bullseye,
				this.Const.Perks.PerkDefs.Dodge,
				this.Const.Perks.PerkDefs.FortifiedMind,
				this.Const.Perks.PerkDefs.HoldOut,
				this.Const.Perks.PerkDefs.Gifted
			],
			[
				this.Const.Perks.PerkDefs.MageLegendMagicHailstone,
				this.Const.Perks.PerkDefs.MageLegendMagicLevitate,
				this.Const.Perks.PerkDefs.LegendPush,
				this.Const.Perks.PerkDefs.Backstabber,
				this.Const.Perks.PerkDefs.Anticipation,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.RallyTheTroops,
				this.Const.Perks.PerkDefs.LegendSpecStaffSkill
			],
			[
				this.Const.Perks.PerkDefs.LegendEntice,
				this.Const.Perks.PerkDefs.MageLegendMagicCircleOfProtection,
				this.Const.Perks.PerkDefs.MageLegendMasteryMagicMissileFocus,
				this.Const.Perks.PerkDefs.SpecDagger,
				this.Const.Perks.PerkDefs.SpecThrowing,
				this.Const.Perks.PerkDefs.LegendSpecBandage
			],
			[
				this.Const.Perks.PerkDefs.MageLegendMagicChainLightning,
				this.Const.Perks.PerkDefs.MageLegendMagicWebBolt,
				this.Const.Perks.PerkDefs.LoneWolf,
				this.Const.Perks.PerkDefs.Overwhelm,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.LegendMedIngredients,
				this.Const.Perks.PerkDefs.LegendSpecStaffStun
			],
			[
				this.Const.Perks.PerkDefs.MageLegendMagicSoothingWind,
				this.Const.Perks.PerkDefs.MageLegendMagicPsybeam,
				this.Const.Perks.PerkDefs.LegendScry,
				this.Const.Perks.PerkDefs.MageLegendMasteryBurningHands,
				this.Const.Perks.PerkDefs.MageLegendMasteryHailstone,
				this.Const.Perks.PerkDefs.MageLegendMasteryChainLightning,
				this.Const.Perks.PerkDefs.Nimble,
				this.Const.Perks.PerkDefs.LegendRelax,
				this.Const.Perks.PerkDefs.Rebound,
				this.Const.Perks.PerkDefs.LegendClarity,
				this.Const.Perks.PerkDefs.LegendMindOverBody,
				this.Const.Perks.PerkDefs.Ballistics
			],
			[
				this.Const.Perks.PerkDefs.MageLegendMagicSleep,
				this.Const.Perks.PerkDefs.MageLegendMagicHealingWind,
				this.Const.Perks.PerkDefs.MageLegendMagicTeleport,
				this.Const.Perks.PerkDefs.MageLegendMasteryMagicMissileMastery,
				this.Const.Perks.PerkDefs.BattleFlow,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
				this.Const.Perks.PerkDefs.LegendFreedomOfMovement,
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.LegendFieldTriage
			],
			[],
			[],
			[],
			[]
		];
	}

	function setGender( _gender = -1 )
	{
		if (_gender == -1)
		{
			_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() == "Disabled" ? 0 : ::Math.rand(0, 1);
		}

		if (_gender != 0)
		{
			return;
		}

		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.removeBackgroundType(this.Const.BackgroundType.Female);
	}

	function onBuildDescription()
	{
		return "{ The air around %name% seems thicker, almost charged. It makes breathing itself difficult. %name% doesn\'t seem to mind though. Instead, %name%\'s eyes reflects a strength of spirit able to bind the laws of nature themselves. }";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-10,
				-10
			],
			Bravery = [
				10,
				20
			],
			Stamina = [
				15,
				20
			],
			MeleeSkill = [
				-5,
				-5
			],
			RangedSkill = [
				20,
				15
			],
			MeleeDefense = [
				-10,
				-10
			],
			RangedDefense = [
				-5,
				-5
			],
			Initiative = [
				10,
				15
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		this.m.Container.add(this.new("scripts/skills/traits/bright_trait"));
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Bravery] = 3;
		talents[this.Const.Attributes.Fatigue] = 3;
		talents[this.Const.Attributes.RangedSkill] = 3;
		this.getContainer().getActor().fillTalentValues(1, true);
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"legend_seer_robes"
			]
		]));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"legend_seer_hat"
			]
		]));
		items.equip(this.new("scripts/items/weapons/legend_mystic_staff"));
		local stash = this.World.Assets.getStash();
		stash.add(this.new("scripts/items/supplies/medicine_item"));
	}

});

