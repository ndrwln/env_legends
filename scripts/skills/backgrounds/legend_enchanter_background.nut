this.legend_enchanter_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_enchanter";
		this.m.Icon = "ui/backgrounds/background_wizard.png";
		local r = this.Math.rand(0, 3);
		this.m.Name = "Enchanter";
		this.m.HiringCost = 1000;
		this.m.DailyCost = 20;
		this.m.Excluded = [
			"trait.impatient",
			"trait.iron_jaw",
			"trait.clubfooted",
			"trait.dumb",
			"trait.insecure",
			"trait.loyal",
			"trait.hesitant",
			"trait.craven",
			"trait.fainthearted",
			"trait.brute",
			"trait.bloodthirsty"
		];
		this.m.Titles = [
			"the Enchanter",
			"the Cacophanous",
			"the Harmonist",
			"Star Singer",
			"the Hum",
			"of Tongues"
		];
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.BackgroundType = this.Const.BackgroundType.Druid;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Cruel;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Chivalrous;
		this.m.Modifiers.Ammo = this.Const.LegendMod.ResourceModifiers.Ammo[0];
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[0];
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[1];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[0];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[0];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[0];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[0];
		this.m.Modifiers.Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[0];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[0];
		this.m.Modifiers.ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[0];
		this.m.Modifiers.MedConsumption = this.Const.LegendMod.ResourceModifiers.MedConsumption[1];
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[0];
		this.m.Modifiers.Fletching = this.Const.LegendMod.ResourceModifiers.Fletching[0];
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[0];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[0];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[2];
		this.m.Modifiers.Enchanting = 1.0;
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.DaggerTree,
				this.Const.Perks.StaffTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.SpearTree
			],
			Defense = [
				this.Const.Perks.ClothArmorTree
			],
			Traits = [
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.CalmTree,
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.InspirationalTree
			],
			Enemy = [],
			Class = [],
			Magic = [
				this.Const.Perks.ValaChantMagicTree
			]
		};
	}

	function onBuildDescription()
	{
		return "{%name% appears to be mumbling beneath their breath constantly, secret mantras that roil and boil in your mind. At times the repeated words rise to a cacophany that seems to distort reality itself, instilling meaning into all those who hear.  It appears this one has trained with the northern enchanters.}";
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"wizard_robe"
			]
		]));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"barbarians/bear_headpiece"
			]
		]));
	}

});

