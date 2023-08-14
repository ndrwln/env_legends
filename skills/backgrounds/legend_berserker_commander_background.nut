this.legend_berserker_commander_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {
		Tattoo = 0
	},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_commander_berserker";
		this.m.Name = "Berserker";
		this.m.Icon = "ui/backgrounds/background_berserker.png";
		this.m.HiringCost = 10000;
		this.m.DailyCost = 0;
		this.m.Excluded = [
			"trait.weasel",
			"trait.teamplayer",
			"trait.fear_beasts",
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
			"trait.disloyal",
			"trait.loyal"
		];
		this.m.Titles = [
			"the Savage",
			"the Outcast",
			"the Wildman",
			"the Feral",
			"the Wild",
			"the Barbarian"
		];
		this.m.Faces = this.Const.Faces.Berserker;
		this.m.Hairs = this.Const.Hair.Berserker;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.Berserker;
		this.m.BeardChance = 100;
		this.m.Bodies = this.Const.Bodies.LegendTattos;
		this.m.Ethnicity = 0;
		this.m.Level = 3;
		this.m.BackgroundType = this.Const.BackgroundType.Combat | this.Const.BackgroundType.Lowborn | this.Const.BackgroundType.Untalented;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Cruel;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.NeutralMax;
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[2];
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[2];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[1];
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
		this.m.CustomPerkTree = [
			[
				this.Const.Perks.PerkDefs.CripplingStrikes,
				this.Const.Perks.PerkDefs.Colossus,
				this.Const.Perks.PerkDefs.LegendKick,
				this.Const.Perks.PerkDefs.Adrenaline,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.Pathfinder,
				this.Const.Perks.PerkDefs.Steadfast,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.BloodyHarvest,
				this.Const.Perks.PerkDefs.LegendBackToBasics,
				this.Const.Perks.PerkDefs.LegendAlert
			],
			[
				this.Const.Perks.PerkDefs.DevastatingStrikes,
				this.Const.Perks.PerkDefs.CoupDeGrace,
				this.Const.Perks.PerkDefs.LegendChoke,
				this.Const.Perks.PerkDefs.LegendSmackdown,
				this.Const.Perks.PerkDefs.LegendOnslaught,
				this.Const.Perks.PerkDefs.Dodge,
				this.Const.Perks.PerkDefs.HoldOut,
				this.Const.Perks.PerkDefs.SteelBrow,
				this.Const.Perks.PerkDefs.QuickHands
			],
			[
				this.Const.Perks.PerkDefs.LegendGrapple,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyGoblin,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyDirewolf,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.Brawny,
				this.Const.Perks.PerkDefs.Anticipation,
				this.Const.Perks.PerkDefs.Taunt,
				this.Const.Perks.PerkDefs.Feint,
				this.Const.Perks.PerkDefs.Debilitate,
				this.Const.Perks.PerkDefs.Relentless,
				this.Const.Perks.PerkDefs.LegendTrueBeliever,
				this.Const.Perks.PerkDefs.Sprint,
				this.Const.Perks.PerkDefs.LegendSecondWind
			],
			[
				this.Const.Perks.PerkDefs.SpecMace,
				this.Const.Perks.PerkDefs.SpecFlail,
				this.Const.Perks.PerkDefs.SpecHammer,
				this.Const.Perks.PerkDefs.SpecAxe,
				this.Const.Perks.PerkDefs.SpecCleaver,
				this.Const.Perks.PerkDefs.LegendSpecGreatSword,
				this.Const.Perks.PerkDefs.LegendSpecFists,
				this.Const.Perks.PerkDefs.LegendPoisonImmunity,
				this.Const.Perks.PerkDefs.SpecThrowing
			],
			[
				this.Const.Perks.PerkDefs.ReachAdvantage,
				this.Const.Perks.PerkDefs.Overwhelm,
				this.Const.Perks.PerkDefs.DoubleStrike,
				this.Const.Perks.PerkDefs.LoneWolf,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.Slaughterer,
				this.Const.Perks.PerkDefs.Vengeance,
				this.Const.Perks.PerkDefs.LegendBattleheart,
				this.Const.Perks.PerkDefs.SunderingStrikes,
				this.Const.Perks.PerkDefs.LegendAmbidextrous,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyOrk,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyGoblin,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyUnhold
			],
			[
				this.Const.Perks.PerkDefs.Berserk,
				this.Const.Perks.PerkDefs.LegendTackle,
				this.Const.Perks.PerkDefs.LegendLacerate,
				this.Const.Perks.PerkDefs.LastStand,
				this.Const.Perks.PerkDefs.LegendMuscularity,
				this.Const.Perks.PerkDefs.Nimble,
				this.Const.Perks.PerkDefs.LastStand,
				this.Const.Perks.PerkDefs.Rebound,
				this.Const.Perks.PerkDefs.LastStand,
				this.Const.Perks.PerkDefs.LegendMuscularity,
				this.Const.Perks.PerkDefs.LegendForwardPush
			],
			[
				this.Const.Perks.PerkDefs.LegendBerserkerRage,
				this.Const.Perks.PerkDefs.LegendBigGameHunter,
				this.Const.Perks.PerkDefs.LegendUberNimble,
				this.Const.Perks.PerkDefs.Fearsome,
				this.Const.Perks.PerkDefs.Duelist,
				this.Const.Perks.PerkDefs.LegendTumble,
				this.Const.Perks.PerkDefs.KillingFrenzy,
				this.Const.Perks.PerkDefs.BattleFlow,
				this.Const.Perks.PerkDefs.LegendBloodbath,
				this.Const.Perks.PerkDefs.LegendFreedomOfMovement
			]
		];
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
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.addBackgroundType(this.Const.BackgroundType.Female);
	}

	function getTooltip()
	{
		local ret = this.character_background.getTooltip();
		ret.push({
			id = 12,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color] Damage when unarmed"
		});
		return ret;
	}

	function onBuildDescription()
	{
		if (this.isBackgroundType(this.Const.BackgroundType.Female))
		{
			return "{For some, the wild is a refuge. | It is said that woman is born with the wilderness in her, and that she does wrong by turning her back on it. | Civilization is a stain, one prolonged arming of every next-generation to better battle the ultimate enemy: Mother Nature herself. | In a time of war, it\'s not surprising that many once again seek refuge in the wild. | Some people flee from town to town. Others stop in between, disappearing into the tranquil forests.} {%name% once found a safe register amongst the trees, but that time is over. | Once a mysterious figure to hunters - the famed masskewatsthat - %name% now returns to civilization for reasons unknown. | %name%\'s got the hands of a blacksmith, but the hygiene of a pigsty. | Maybe it was spurned love, or maybe just war, but %name% has spent the last decade far from the rest of mankind. | Possibly a poacher who settled where she hunted, %name%\'s lived amongst the trees for untold years. | With cleverly stitched garb, %name%\'s atavistic appearance perhaps belies a past as a tailor or tanner.} {There is an obvious language barrier with the berserker, but for some reason she seems very willing to fight. Let\'s hope his newfound \'calling\' doesn\'t have a darker purpose behind it. | Colorful and permanent ritual rites circle about her body. When asked why she wishes to join a band of mercenaries, she hoots and, with a crooked finger, replicates one of her fleshen arts across the sky. | Wounds, old and fresh, dot her already mottled body. And they are not superficial - this woman had been fighting something fierce in the wild. | One has to wonder if the calamities which chased her into the forests have come to chase her back out. | Judging by her wild grunting, it\'s doubtful she\'s here to rejoin civilization. | Years as a recluse haven\'t made the woman forget what a few crowns can get you. The question is, why did she come back? | She has the strength to wrestle a boar - and her many scars makes you wonder if perhaps she did.}";
		}
		else
		{
			return "{For some, the wild is a refuge. | It is said that man is born with the wilderness in him, and that he does wrong by turning his back on it. | Civilization is a stain, one prolonged arming of every next-generation to better battle the ultimate enemy: Mother Nature herself. | In a time of war, it\'s not surprising that many once again seek refuge in the wild. | Some people flee from town to town. Others stop in between, disappearing into the tranquil forests.} {%name% once found a safe register amongst the trees, but that time is over. | Once a mysterious figure to hunters - the famed masskewatsthat - %name% now returns to civilization for reasons unknown. | %name%\'s got the hands of a blacksmith, but the hygiene of a pigsty. | Maybe it was spurned love, or maybe just war, but %name% has spent the last decade far from the rest of mankind. | Possibly a poacher who settled where he hunted, %name%\'s lived amongst the trees for untold years. | With cleverly stitched garb, %name%\'s atavistic appearance perhaps belies a past as a tailor or tanner.} {There is an obvious language barrier with the berserker, but for some reason he seems very willing to fight. Let\'s hope his newfound \'calling\' doesn\'t have a darker purpose behind it. | Colorful and permanent ritual rites circle about his body. When asked why he wishes to join a band of mercenaries, he hoots and, with a crooked finger, replicates one of his fleshen arts across the sky. | Wounds, old and fresh, dot his already mottled body. And they are not superficial - this man had been fighting something fierce in the wild. | One has to wonder if the calamities which chased him into the forests have come to chase him back out. | Judging by his wild grunting, it\'s doubtful he\'s here to rejoin civilization. | Years as a recluse haven\'t made the man forget what a few crowns can get you. The question is, why did he come back? | He has the strength to wrestle a boar - and his many scars makes you wonder if perhaps he did.}";
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				20,
				25
			],
			Bravery = [
				5,
				10
			],
			Stamina = [
				15,
				20
			],
			MeleeSkill = [
				20,
				25
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				-5,
				-5
			],
			RangedDefense = [
				-5,
				-5
			],
			Initiative = [
				-5,
				-5
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

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setTitle("The Berserker");
		this.m.Container.add(this.new("scripts/skills/traits/deathwish_trait"));
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeSkill] = 3;
		talents[this.Const.Attributes.Hitpoints] = 3;
		this.getContainer().getActor().fillTalentValues(2, true);
		local items = this.getContainer().getActor().getItems();
		local stash = this.World.Assets.getStash();
		stash.removeByID("supplies.ground_grains");
		stash.removeByID("supplies.ground_grains");
		stash.add(this.new("scripts/items/accessory/berserker_mushrooms_item"));
		stash.add(this.new("scripts/items/accessory/berserker_mushrooms_item"));
		stash.add(this.new("scripts/items/supplies/roots_and_berries_item"));
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"werewolf_hide_armor"
			]
		]));
		local r = this.Math.rand(0, 5);

		if (r == 0)
		{
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/legend_chain"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/butchers_cleaver"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/throwing_axe"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/weapons/hatchet"));
		}
		else if (r == 5)
		{
			items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
		}
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

