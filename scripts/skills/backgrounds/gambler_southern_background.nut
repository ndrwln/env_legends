this.gambler_southern_background <- this.inherit("scripts/skills/backgrounds/gambler_background", {
	m = {},
	function create()
	{
		this.gambler_background.create();
		this.m.Bodies = this.Const.Bodies.SouthernThick;
		this.m.Faces = this.Const.Faces.SouthernMale;
		this.m.Hairs = this.Const.Hair.SouthernMale;
		this.m.HairColors = this.Const.HairColors.Southern;
		this.m.Beards = this.Const.Beards.Southern;
		this.m.Ethnicity = 1;
		this.m.BeardChance = 90;
		this.m.Excluded = [
			"trait.superstitious",
			"trait.huge",
			"trait.fear_undead",
			"trait.hate_undead",
			"trait.hate_beasts",
			"trait.paranoid",
			"trait.brute",
			"trait.athletic",
			"trait.dumb",
			"trait.clumsy",
			"trait.loyal",
			"trait.craven",
			"trait.dastard",
			"trait.deathwish",
			"trait.short_sighted",
			"trait.spartan",
			"trait.insecure",
			"trait.hesitant",
			"trait.strong",
			"trait.tough",
			"trait.bloodthirsty",
			"trait.pragmatic"
		];
		this.m.Names = this.Const.Strings.SouthernNames;
		this.m.LastNames = this.Const.Strings.SouthernNamesLast;
	}

	function onBuildDescription()
	{
		return "{They say luck is the devil, so just how long can a gambler like %name% play with it? | Everyone gambles, so %name% figured why not do it for money? | Dice, cards, marbles - there are a lot of ways to take a man\'s money, and %name% knows all of them. | %name%\'s got the eyes of a desert snake - and shaping cards is his rattle. | In a world of life or death, taking risks is %name%\'s game. | A man like %name% sees everything coming, especially the next card in the deck.} {He supported himself by playing cards from town to town, only leaving after he\'d cleaned out their pockets. | But it is a mystery as to how a man decides to take up cards as a lifestyle. | The constant coming and going of mercenaries made for easy targets - until one sore loser ran him off with a bastard sword. | Orphaned by his own birth, he\'s always scrounged up a living by gambling with others. | When he was a kid, a trickster\'s cup-game showed him the value in hustling. | When his father fell into gambling debts, he figured the best way to pay them back was to become an even better hustler himself. | After taking all their crowns, towns across the land banned %name% from hustling in a fit of so-called \'religious revival.\'} {Now, the gambler seeks to throw his dice into the wind - as well as the mud, taking rank with any outfit that pays. | One has to wonder what a cardplayer is doing not playing cards. Then again, maybe it\'s good that he sees your group as a smart gamble. | Perhaps years of scamming mercenaries has given him the notion that he could just as easily be one. | Clever and quick-thinking, the cardshaper survives by moving before anyone else does, a skill as useful as any other in this world. | Ironically, a bad play put him into enormous debt with a baron. Now he has to find another way to pay it back. | Wars have sapped most of the fish from his cards games. Instead of waiting around he figured he\'d just go ahead and follow them.}";
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"noble_tunic"
			],
			[
				1,
				"oriental/cloth_sash"
			],
			[
				2,
				""
			]
		]));
	}

});

