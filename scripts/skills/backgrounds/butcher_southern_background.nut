this.butcher_southern_background <- this.inherit("scripts/skills/backgrounds/butcher_background", {
	m = {},
	function create()
	{
		this.butcher_background.create();
		this.m.Bodies = this.Const.Bodies.SouthernMale;
		this.m.Faces = this.Const.Faces.SouthernMale;
		this.m.Hairs = this.Const.Hair.SouthernMale;
		this.m.HairColors = this.Const.HairColors.Southern;
		this.m.Beards = this.Const.Beards.Southern;
		this.m.Ethnicity = 1;
		this.m.BeardChance = 60;
		this.m.Names = this.Const.Strings.SouthernNames;
		this.m.LastNames = this.Const.Strings.SouthernNamesLast;
	}

	function onBuildDescription()
	{
		return "{After his father\'s death, %name% took over the family butcher shop in %randomtown%. | Growing up poor, %name% quickly learned to kill and strip animals, eventually founding a butcher\'s shop. | With droughts ruining the farmlands, %name%\'s butcher shop took off in %randomcitystate%. | Always a strange boy, %name% took to butchering not only for profit, but for pleasure. | Grinning ear to ear, %name% never looked so happy as when his shop opened and he got his first order of live pigs in stock. | As a butcher, %name% has spent years squishing guts out of dead rabbits and lopping heads off sometimes-dead fish.} {But rumors of animal torture eventually drove the cleaver-swinger from his business. | Given the terrible rumors of dark arts already going around, it wasn\'t long until people began questioning the source of his meats and drove him out of business. | But killing animals, for one reason or another, didn\'t quite excite him anymore. He sought something new. | After a human finger was found in one of his deer wrappings, the man was driven from his business. | Some say he most enjoyed butchering for the viziers\' men during one of their campaigns against the desert tribes and wishes to return to that experience once more. | Unfortunately, the war drove through his shop, leaving behind a number of carcasses he wouldn\'t dare butcher. | Butchering a tiny pig became a scandal when it turned out to be a nobleman\'s pet. He fled to save his own bacon.} {Something about blood and guts sits just right with %name%. In that case, welcome to the battlefield. | %name% looks at everything as a potential meat sale with breathing, moving packaging. | Many are disturbed by %name%\'s mere presence and all-too-wide eyes. | %name% is known to bite his tongue and savor the blood. | %name%\'s ears perk whenever a pig squeals. The same thing happens when a man screams. Interesting. | %name%\'s a butcher, but apparently has little interest in actually feeding the outfit.}";
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 2);

		if (r <= 1)
		{
			items.equip(this.new("scripts/items/weapons/butchers_cleaver"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}

		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"butcher_apron"
			]
		]));
	}

});

