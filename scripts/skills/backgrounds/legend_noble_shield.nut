this.legend_noble_shield <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_noble_shield";
		this.m.Name = "Foot Soldier";
		this.m.Icon = "ui/backgrounds/background_nobleshield.png";
		this.m.HiringCost = 750;
		this.m.DailyCost = 35;
		this.m.DailyCostMult = 1.0;
		this.m.Excluded = [
			"trait.hate_undead",
			"trait.hate_beasts",
			"trait.hate_greenskins",
			"trait.hate_nobles",
			"trait.huge",
			"trait.weasel",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_nobles",
			"trait.paranoid",
			"trait.night_blind",
			"trait.ailing",
			"trait.impatient",
			"trait.asthmatic",
			"trait.greedy",
			"trait.dumb",
			"trait.clubfooted",
			"trait.drunkard",
			"trait.disloyal",
			"trait.tiny",
			"trait.fragile",
			"trait.clumsy",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.dastard",
			"trait.insecure",
			"trait.double_tongued"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill
		];
		this.m.GoodEnding = "He supported you from the start, %name%, and he was with you in retirement, leaving the company not long after you did. Though he was a lowly peasant, he proved himself in battle after battle and slowly became as trusted and valued a friend as one can have in a mercenary company.";
		this.m.BadEnding = "Supporting you from the start, %name% was as loyal as he was talented. He stayed with the company for a time before eventually leaving to forge out a path for himself. The other day, you received a letter from the mercenary stating that he had started his own company and was in dire need of help. Unfortunately, the message was dated to nearly a full year ago. When you investigated the existence of his company, you learned that it had been completely annihilated in a battle between nobles.";
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.BackgroundType = this.Const.BackgroundType.Combat;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[1];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[1];
		this.m.PerkTreeDynamicMins.Defense = 3;
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.SpearTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.ShieldTree
			],
			Defense = [
				this.Const.Perks.HeavyArmorTree
			],
			Traits = [
				this.Const.Perks.FastTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.SturdyTree,
				this.Const.Perks.IndestructibleTree
			],
			Enemy = [],
			Class = [],
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

		this.m.Faces = this.Const.Faces.AllWhiteFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.addBackgroundType(this.Const.BackgroundType.Female);
		this.m.GoodEnding = "Supporting your cause from the start, %name% was with you in retirement, leaving the company not long after you did. Though she was a lowly peasant, she proved herself in battle after battle and slowly became as trusted and valued a friend as one can have in a mercenary company.";
		this.m.BadEnding = "A supporter of your cause from the start, %name% was as loyal as she was talented. She stayed with the company for a time before eventually leaving to forge out a path for himself. The other day, you received a letter from the mercenary stating that she had started her own company and was in dire need of help. Unfortunately, the message was dated to nearly a full year ago. When you investigated the existence of her company, you learned that it had been completely annihilated in a battle between nobles.";
	}

	function onBuildDescription()
	{
		if (this.isBackgroundType(this.Const.BackgroundType.Female))
		{
			return "%name% is not known to be a big talker, but she has every right to be. {She\'s saved the lives of many of the company. | She once spared you from an orc\'s wicked chain. | An assassin would have killed the local noble in a pub were it not for this woman. | A misfired crossbow nearly took out your eye - hadn\'t %name%\'s shield been there to stop it. | She once pushed two men off a cliff using only her shield and two strong legs. | She learned how to fight from her father, a vanguard at the Battle of Many Names. | Sacrificing her family\'s heirloom - an old shield of wood and studded iron - she saved the local noble\'s life. | A woman of rather consistent heroism, she pulled a drunken captain from a pub fire. | Faced with a horde of goblins, she used her shield and strength to push a hole in their lines, opening the way for the rest of her company to kill them all.} With quick whirls and whips of her shield, the woman\'s deflected all manner of mortal danger. Although rather quiet, you\'ve found %name%\'s place in a shield-wall to be rather indispensable.";
		}
		else
		{
			return "%name% is not known to be a big talker, but he has every right to be. {He\'s saved the lives of many of the company. | He once spared you from an orc\'s wicked chain. | An assassin would have killed the local noble in a pub were it not for this man. | A misfired crossbow nearly took out your eye - hadn\'t %name%\'s shield been there to stop it. | He once pushed two men off a cliff using only his shield and two strong legs. | He learned how to fight from his father, a vanguard at the Battle of Many Names. | Sacrificing his family\'s heirloom - an old shield of wood and studded iron - he saved the local noble\'s life. | A man of rather consistent heroism, he pulled a drunken %2h% from a pub fire. | Faced with a horde of goblins, he used his shield and strength to push a hole in their lines, opening the way for the rest of her company to kill them all.} With quick whirls and whips of his shield, the man\'s deflected all manner of mortal danger. Although rather quiet, you\'ve found %name%\'s place in a shield-wall to be rather indispensable.";
		}
	}

	function onPrepareVariables( _vars )
	{
		_vars.extend(this.World.Assets.getFounderNames());
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				5,
				5
			],
			Bravery = [
				10,
				5
			],
			Stamina = [
				3,
				3
			],
			MeleeSkill = [
				10,
				10
			],
			RangedSkill = [
				-5,
				-5
			],
			MeleeDefense = [
				5,
				10
			],
			RangedDefense = [
				5,
				5
			],
			Initiative = [
				-10,
				-10
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();

		if (this.Math.rand(0, 3) == 3)
		{
			actor.setTitle(this.Const.Strings.SellswordTitles[this.Math.rand(0, this.Const.Strings.SellswordTitles.len() - 1)]);
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/weapons/militia_spear"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"padded_surcoat"
			],
			[
				2,
				"basic_mail_shirt"
			]
		]));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				10,
				"aketon_cap"
			],
			[
				10,
				"open_leather_cap"
			],
			[
				10,
				"kettle_hat"
			],
			[
				10,
				"padded_kettle_hat"
			],
			[
				10,
				"kettle_hat_with_mail"
			],
			[
				10,
				"mail_coif"
			],
			[
				1,
				"legend_enclave_vanilla_armet_02"
			],
			[
				1,
				"legend_enclave_vanilla_skullcap_01"
			]
		]));
	}

});

