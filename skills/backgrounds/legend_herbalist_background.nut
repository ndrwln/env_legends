this.legend_herbalist_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_herbalist";
		this.m.Name = "Herbalist / Apothecaries";
		this.m.Icon = "ui/backgrounds/herbalist.png";
		this.m.BackgroundDescription = "Herbalists and Apothecaries are skilled with a sickle, harvesting herbs for use in medicine";
		this.m.GoodEnding = "%name% the herbalist left to start an Apothecary in the wetlands, business is good and remedies abound. Last you heard %name% had discovered a cure for bunions and people traveled from far and wide to try the soup";
		this.m.BadEnding = "%name% went off to become a herbalist again, but the cures didn\'t work and they soon got a reputation as a quack. Looking for more potent cures, %name% poisoned themself and never recovered.";
		this.m.HiringCost = 120;
		this.m.DailyCost = 18;
		this.m.Excluded = [
			"trait.weasel",
			"trait.hate_beasts",
			"trait.fear_beasts",
			"trait.swift",
			"trait.impatient",
			"trait.clubfooted",
			"trait.brute",
			"trait.gluttonous",
			"trait.disloyal",
			"trait.cocky",
			"trait.dumb",
			"trait.iron_lungs",
			"trait.craven",
			"trait.greedy",
			"trait.bloodthirsty"
		];
		this.m.Titles = [
			"the Gentle",
			"the Wise",
			"the Sage",
			"the Soothsayer",
			"the Healer",
			"the Quiet",
			"the Calm",
			"the Apothecary"
		];
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.Monk;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Monk;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Kind;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.BackgroundType = this.Const.BackgroundType.OffendedByViolence | this.Const.BackgroundType.Ranger | this.Const.BackgroundType.Druid;
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[2];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[1];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[1];
		this.m.Modifiers.MedConsumption = this.Const.LegendMod.ResourceModifiers.MedConsumption[2];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[3];
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
				this.Const.Perks.SwordTree,
				this.Const.Perks.AxeTree,
				this.Const.Perks.StaffTree,
				this.Const.Perks.BowTree
			],
			Defense = [
				this.Const.Perks.ClothArmorTree
			],
			Traits = [
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.OrganisedTree,
				this.Const.Perks.AgileTree,
				this.Const.Perks.CalmTree
			],
			Enemy = [
				this.Const.Perks.SchratTree,
				this.Const.Perks.HexenTree
			],
			Class = [
				this.Const.Perks.SickleClassTree,
				this.Const.Perks.HealerClassTree
			],
			Magic = []
		};
	}

	function setGender( _gender = -1 )
	{
		local r = _gender;

		if (_gender == -1)
		{
			r = this.Math.rand(0, 3);

			if (::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled")
			{
				r = this.Math.rand(0, 1);
			}
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
	}

	function onBuildDescription()
	{
		return "{After raiders murdered his family, %name% retreated into the swamp and became a herbalist. | Rarely traveling, %name% preferred the company of the birds. | %name%, has searched far and wide for curative ingredients. | A wandering herbalist, %name% used to traverse the wild landscapes near %randomtown%. | Abandoned to a river, %name% grew up in the wildlands, and learned how to make use of natural ingredients. | Trying to heal a land of ruin, %name% became a herbalist. | Always an unruly child, %name%\'s parents let him run wild in the woods where he eventually learned to love the plants more than humans.} {Unfortunately, his master\'s liking for youth and fleshen things led to a terrible scandal. %name% fled to preserve his life. | But his faith was irreversibly damaged as a hellacious attack by raiders left men castrated, women raped, and children skewered on spits. | Though a believer in the old gods, the herbalist could not stand the world of men. The herbalist eventually left to seek spirituality on their own terms. | As the world\'s suffering grew, %name%\'s abbot requested that she go out and heal the people of the earth - or kill those who did them wrong. | Cults of death, beasts of nightmare, and men of cruelty. %name% left the halls of his temple to purify them all. | But seeing the horrible thigns humans wrought, %name% abandoned the city, seeking out survival by other means. | Unfortunately, his herbs could not save others from slaughter. %name% realized that his herbs wer better invested in looking out for oneself than muttering to some so-called god. | Always fiery, %name% left the safety of the wetlands to go out and heal the world. | One of the few literate men around, %name% abandoned his ascetic life to learn more of the world and, hopefully, to cure that which sickened it. | But one night a woman he bedded concinved him to consider the plight of others,  and they never returned to the swamp. | But he used his trusted position for ill-gotten gains, stealing from the apothecary\'s treasury. It didn\'t take long for the scandal to drive him out. | Unfortunately, there were accusations of witchcraft. Nobody knows the truth behind the story, but %name% did not last much longer at the church. | One night, witnessing a terrible event in the beloved wetlands. Not long after, %name% quickly left the swamp, never quite saying what was discovered.} {The herbalist hardly knows a thing about fighting, but is very skilled at slicing mushrooms quickly and accurately. | Years of solitude and prayer have left %name% out of shape, but it is his quick hands that is of most value. | Perhaps never really content with his life, it\'s difficult to entirely know why someone like %name% would join a band of mercenaries. | Maybe there are too many illnesses in the world, or too many inside, but you don\'t question why %name% wishes to join a band of sellswords. | Medicine won\'t cleave a greenskin, but a sickle might. | %name%\'s stated desire to rid the world of \'the sickness\' is almost scary in its determination. | While %name%\'s knowledge of secret things is to be commended, the constant mutterings to the old gods are a bit annoying. | While %name% may not be used to armor and shields, few mercenaries have the skill with a blade. | A bundle of herbs in hand, %name% has sought the company of sellswords. | The pestle he carries is thick enough to be used as a shield, but %name% looks absolutely horrified when you say as much out loud. | Perhaps with a romantic view of mercenaries in need of a a remedy, %name% seeks to accompany sellswords. | Once having read of warrior priests, %name% now wishes to emulate those brave, unwavering soldiers of faith. | You get the feeling %name% wants release from this sickened world. If that\'s the truth then this is the right place.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-5,
				-5
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				5,
				0
			],
			MeleeSkill = [
				5,
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
				0,
				0
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"legend_herbalist_robe"
			]
		]));
		items.equip(this.new("scripts/items/weapons/legend_sickle"));
	}

});

