this.legend_premonitionist_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_premonitionist";
		this.m.Icon = "ui/backgrounds/background_wizard_3.png";
		this.m.Name = "Premonitionist";
		this.m.HiringCost = 1000;
		this.m.DailyCost = 20;
		this.m.Excluded = [
			"trait.brave",
			"trait.athletic",
			"trait.bloodthirsty",
			"trait.brute",
			"trait.dexterous",
			"trait.eagleyes",
			"trait.fearless",
			"trait.huge",
			"trait.loyal",
			"trait.quick",
			"trait.swift",
			"trait.sure_footing",
			"trait.tough",
			"trait.disloyal",
			"trait.loyal"
		];
		this.m.Titles = [
			"the Enthralling",
			"the Fascinating",
			"the Dreamer",
			"the Clairvoyant",
			"the Diviner"
		];
		this.m.Faces = this.Const.Faces.AllWhiteFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.m.BackgroundType = this.Const.BackgroundType.Female | this.Const.BackgroundType.Educated | this.Const.BackgroundType.Untalented;
		this.m.Level = 1;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Chivalrous;
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Scout[3];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Meds[2];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[2];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[2];
		this.m.Modifiers.MedConsumption = this.Const.LegendMod.ResourceModifiers.MedConsumption[3];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.DaggerTree,
				this.Const.Perks.StaffTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.CrossbowTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.DeviousTree,
				this.Const.Perks.OrganisedTree,
				this.Const.Perks.InspirationalTree
			],
			Enemy = [],
			Class = [],
			Magic = [
				this.Const.Perks.PremonitionMagicTree
			]
		};
	}

	function setGender( _gender = -1 )
	{
		local r = _gender;

		if (_gender == -1)
		{
			r = 1;

			if (::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled")
			{
				r = this.Math.rand(0, 1);
			}
		}

		if (r != 0)
		{
			return;
		}

		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.removeBackgroundType(this.Const.BackgroundType.Female);
	}

	function onBuildDescription()
	{
		return "{Mwah has absolutely 0 flavor text creation ability. Please understand how sick this super cool premonitionist is while you have your tarot reading!}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-15,
				-10
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
				-10,
				-10
			],
			RangedSkill = [
				0,
				5
			],
			MeleeDefense = [
				0,
				5
			],
			RangedDefense = [
				0,
				5
			],
			Initiative = [
				5,
				15
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Fatigue] = 3;
		this.getContainer().getActor().fillTalentValues(2, true);
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"legend_seer_robes"
			]
		]));
		items.equip(this.new("scripts/items/weapons/legend_mystic_staff"));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"legend_seer_hat"
			],
			[
				1,
				"magician_hat"
			]
		]));
		local stash = this.World.Assets.getStash();
	}

});

