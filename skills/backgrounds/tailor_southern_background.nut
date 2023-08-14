this.tailor_southern_background <- this.inherit("scripts/skills/backgrounds/tailor_background", {
	m = {},
	function create()
	{
		this.tailor_background.create();
		this.m.Bodies = this.Const.Bodies.SouthernThick;
		this.m.Faces = this.Const.Faces.SouthernMale;
		this.m.Hairs = this.Const.Hair.SouthernMale;
		this.m.HairColors = this.Const.HairColors.Southern;
		this.m.Beards = this.Const.Beards.Southern;
		this.m.Ethnicity = 1;
		this.m.Excluded = [
			"trait.superstitious",
			"trait.huge",
			"trait.hate_undead",
			"trait.athletic",
			"trait.deathwish",
			"trait.clumsy",
			"trait.fearless",
			"trait.spartan",
			"trait.brave",
			"trait.iron_lungs",
			"trait.strong",
			"trait.tough",
			"trait.cocky",
			"trait.dumb",
			"trait.brute",
			"trait.bloodthirsty"
		];
		this.m.Names = this.Const.Strings.SouthernNames;
		this.m.LastNames = this.Const.Strings.SouthernNamesLast;
	}

	function onBuildDescription()
	{
		return "{%name% was always curious about fabrics, seeing more science in a linen cloth than {a diviner would in the sands of the desert. | a haruspex would in a toad\'s entrails. | an alchemist would in a mortar and pestle.} | %name% was always an odd boy growing up, fancying a good silk dress instead of the girl beneath it. | Son to a {butcher | soldier}, %name%\'s turn toward fashioning clothes was a surprise to all. | While %name%\'s brothers fancied being warriors and heroes, %name% thought of himself as a future dresser of viziers. | %name% spent much of his youth in the company of girls, but not for the reasons one might think. | %name% always fancied animals, particularly how they would look as a good coat or scarf. | As tunics and shirts grew popular, %name% turned to tailoring to make a crown or two. | With a surge in pantaloons popularity, %name% went from being a tanner to a tailor to make more money. | Tailoring is the science of colors and fabrics, by which standards %name% is renowned. | Good with measuring and calculating, %name% turned his mathematical prowess to tailoring to earn as much as he could. | %name% took up tailoring to honor his father, a tailor who was killed by an unhappy customer. | Widowed by war, %name%\'s mother taught him how to put his hands to better use in tailoring instead of killing.} {When nomads attacked his home, %name% dressed everyone up in clever disguises. The town was destroyed, but not a soul was lost. | He spent many years dressing royalty until a fashion faux pas led his being exiled. | Unfortunately, a man fancying a good fabric, as %name% is wont to do, left the tailor ostracized from many a village. | He tried to make his break in the city, but sadly he just could not compete with the other tailors. | When a vizier organized an army, %name% handled the clothes, giving the conscripts proper uniforms. | But a fierce competition between tailors led to a linen-wrapped deadman and %name% coincidentally leaving his shop behind. | He once choked out a would-be thief with a cord of measuring wire. So he says, anyway. | Once tasked with making a tunic embroidered with epic feats, %name% wondered what the outside world was really like. | Designing a dress adorned with {epic quests | epic feats}, %name% wondered if maybe he should be the one they wove stories about.} Now the tailor looks for a new life, no matter where it takes him. {Maybe he can dress the unit well, or something. | He\'s particular and peculiar, peppering everyone with clothing criticisms. | He\'s no natural soldier, but he appraises a man\'s attire as if he\'s about to go to war with it. | The way he measures and calculates for dressing, it\'s too bad %name% wasn\'t a siege engineer. | While hardly a soldier, %name%\'s earnest love for tailoring is to be admired. | %name%\'s knowledge of various cloths is seriously impressive. | A bit on the nimby-pimby side, %name% has the footwork of a swordfighter, but the swordfighting of a soft breeze. | %name% would seem very out of place in a suit of armor, but boy is he going to need one. | As it turns out, %name% can in fact make a silk purse out of a sow\'s ear. | Don\'t let his vocation fool you, %name% is more deft with his hands than some {cardsharks | jugglers | pickpockets}. | Tailors don\'t seem fit for combat, but then again neither do most of the men you run across these days. | A tailor seems ill-fit for combat, yet for some reason you find the finest soldiers in the strangest of places. | With an eye {for calculations | for measuring}, %name% is a lot smarter than he lets on at first glance.}";
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"linen_tunic"
			],
			[
				1,
				"oriental/cloth_sash"
			]
		]));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"feathered_hat"
			],
			[
				1,
				"oriental/southern_head_wrap"
			]
		]));
	}

});

