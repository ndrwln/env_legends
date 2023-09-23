this.beast_hunter_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.beast_slayer";
		this.m.Name = "Beast Slayer";
		this.m.Icon = "ui/backgrounds/background_57.png";
		this.m.BackgroundDescription = "Beast Slayers are used to expertly hunt monstrous beasts at all ranges.";
		this.m.GoodEnding = "%name% retired from the company and bought the deed to an abandoned castle. There he commands a troop of fellow beast slayers who journey the land protecting it from monsters. Last you spoke to him he had a raven-haired lady friend who did not take kindly to your presence, nor the presence of anyone else for that matter. You\'re sure he\'s happy.";
		this.m.BadEnding = "After leaving the %companyname%, %name% retired from beast slaying altogether and last you heard he fathered an albino daughter. Unfortunately, rumors spread quickly about the girl having supernatural powers and her mother was executed by fire. The father and child were never caught nor seen again.";
		this.m.HiringCost = 150;
		this.m.DailyCost = 15;
		this.m.Excluded = [
			"trait.superstitious",
			"trait.weasel",
			"trait.fear_beasts",
			"trait.ailing",
			"trait.bleeder",
			"trait.dumb",
			"trait.fragile",
			"trait.night_blind",
			"trait.clubfooted",
			"trait.brute",
			"trait.short_sighted",
			"trait.fat",
			"trait.clumsy",
			"trait.gluttonous",
			"trait.asthmatic",
			"trait.craven",
			"trait.dastard",
			"trait.seductive"
		];
		this.m.Titles = [
			"the Beasthunter",
			"Woodstalker",
			"the Beastslayer",
			"the Tracker",
			"the Trophyhunter",
			"the Hunter"
		];
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Level = this.Math.rand(2, 3);
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Merciless;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Good;
		this.m.BackgroundType = this.Const.BackgroundType.Combat | this.Const.BackgroundType.Ranger | this.Const.BackgroundType.ExpertHunter;
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[2];
		this.m.Modifiers.Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[2];
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[2];
		this.m.Modifiers.Terrain = [
			0.0,
			0.0,
			0.0,
			0.025,
			0.0,
			0.025,
			0.025,
			0.025,
			0.025,
			0.01,
			0.0,
			0.0,
			0.015,
			0.015,
			0.015,
			0.0,
			0.0,
			0.0,
			0.0
		];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.SpearTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.BowTree
			],
			Defense = [
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.LightArmorTree
			],
			Traits = [
				this.Const.Perks.ViciousTree,
				this.Const.Perks.DeviousTree,
				this.Const.Perks.AgileTree,
				this.Const.Perks.CalmTree,
				this.Const.Perks.FitTree
			],
			Enemy = [
				this.Const.Perks.SchratTree,
				this.Const.Perks.LindwurmTree,
				this.Const.Perks.AlpTree,
				this.Const.Perks.HexenTree,
				this.Const.Perks.DirewolfTree,
				this.Const.Perks.SpiderTree,
				this.Const.Perks.GhoulTree,
				this.Const.Perks.UnholdTree
			],
			Class = [
				this.Const.Perks.BeastClassTree
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

		this.m.Faces = this.Const.Faces.AllWhiteFemale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.addBackgroundType(this.Const.BackgroundType.Female);
		this.m.GoodEnding = "%name% retired from the company and bought the deed to an abandoned castle. There she commands a troop of fellow beast slayers who journey the land protecting it from monsters. Last you spoke to her she had a raven-haired lady friend who did not take kindly to your presence, nor the presence of anyone else for that matter. You\'re sure she\'s happy.";
		this.m.BadEnding = "After leaving the %companyname%, %name% retired from beast slaying altogether and last you heard she was mother of an albino daughter. Unfortunately, rumors spread quickly about the girl having supernatural powers and her father was executed by fire. The mother and child were never caught nor seen again.";
	}

	function onBuildDescription()
	{
		if (this.isBackgroundType(this.Const.BackgroundType.Female))
		{
			return "{{%name%\'s past is hardly an extravagant one. | %name% has been traveling these parts for some time, but not always in her current vocation. | Despite her grisly job, %name% did not come from an extraordinary life. | A long list of defeated beasts and the pelts to prove it misleads one as to %name%\'s background.} {The beast slayer was once a mere hunter, armed with both bow and wisdom. However, upon discovering a monstrous direwolf in one of his traps she acquired a taste for hunting more dangerous foes. | When her village kept getting attacked by webknechts, the woman took to learning all she could about hunting beasts. And then doing just that to much success. | It\'s said she was a village\'s miller until alps haunted the town whole. Never much of a sleeper herself, she spent nights learning about the monsters until she bettered them. | She served as prey finder for a local lord. But when a hunt went awry and into the jaws of an unhold, the woman turned to studying beasts and how to slay them. | A mere lumberjack, the beast slayer came into true being when all her peers were slaughtered at the hands of a schrat, a living tree. She avenged her friends and vowed to learn all she could of monsters. | A former nun, the woman turned to studying beasts and swords alike after nachzehrers ravaged her monastery.} {Times are changing, though, and not even this skilled monstrum hunter can go it alone. She seeks to join a company and kill as many beasts as she can. | The days are uncharacteristically short and the moon blooms bright every night. This slayer feels a change in the air, and if she\'s going to fight what\'s coming she\'ll need more than just herself to do it. | While not fond of company, the beast slayer wants to kill as many creatures as she can, and she\'ll need the help of some fine comrades to do just that. | In a world becoming more dangerous and desperate, the beast slayer seeks coin and company both. | A professional journeywoman such as this woman could be of great use to a mercenary company and you\'ve little doubt she\'ll be diligent in her death dealing. | Unfortunately, the woman took an apprentice under her wings only for the kid to be slaughtered by a direwolf. The broken beast slayer now seeks sturdier company.}}";
		}
		else
		{
			return "{{%name%\'s past is hardly an extravagant one. | %name% has been traveling these parts for some time, but not always in his current vocation. | Despite his grisly job, %name% did not come from an extraordinary life. | A long list of defeated beasts and the pelts to prove it misleads one as to %name%\'s background.} {The beast slayer was once a mere hunter, armed with both bow and wisdom. However, upon discovering a monstrous direwolf in one of his traps he acquired a taste for hunting more dangerous foes. | When his village kept getting attacked by webknechts, the man took to learning all he could about hunting beasts. And then doing just that to much success. | It\'s said he was a village\'s miller until alps haunted the town whole. Never much of a sleeper himself, he spent nights learning about the monsters until he bettered them. | He served as prey finder for a local lord. But when a hunt went awry and into the jaws of an unhold, the man turned to studying beasts and how to slay them. | A mere lumberjack, the beast slayer came into true being when all his peers were slaughtered at the hands of a schrat, a living tree. He avenged his friends and vowed to learn all he could of monsters. | A former monk, the man turned to studying beasts and swords alike after nachzehrers ravaged his monastery.} {Times are changing, though, and not even this skilled monstrum hunter can go it alone. He seeks to join a company and kill as many beasts as he can. | The days are uncharacteristically short and the moon blooms bright every night. This slayer feels a change in the air, and if he\'s going to fight what\'s coming he\'ll need more than just himself to do it. | While not fond of company, the beast slayer wants to kill as many creatures as he can, and he\'ll need the help of some fine comrades to do just that. | In a world becoming more dangerous and desperate, the beast slayer seeks coin and company both. | A professional journeyman such as this man could be of great use to a mercenary company and you\'ve little doubt he\'ll be diligent in his death dealing. | Unfortunately, the man took an apprentice under his wings only for the kid to be slaughtered by a direwolf. The broken beast slayer now seeks sturdier company.}}";
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				3,
				5
			],
			Bravery = [
				13,
				10
			],
			Stamina = [
				5,
				7
			],
			MeleeSkill = [
				5,
				5
			],
			RangedSkill = [
				11,
				7
			],
			MeleeDefense = [
				1,
				4
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				7,
				5
			]
		};
		return c;
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");

		if (this.Math.rand(1, 100) <= 75)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 75)
		{
			tattoo_head.setBrush("scar_02_head");
			tattoo_head.Visible = true;
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(1, 4);

		if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/hunting_bow"));
			items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
			items.addToBag(this.new("scripts/items/weapons/knife"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/boar_spear"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/spetum"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/weapons/javelin"));
		}

		if (this.Math.rand(1, 100) <= 50 && items.getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
		{
			items.equip(this.new("scripts/items/tools/throwing_net"));
		}

		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"ragged_surcoat"
			],
			[
				1,
				"thick_tunic"
			],
			[
				1,
				"leather_tunic"
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

