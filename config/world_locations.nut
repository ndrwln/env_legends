local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

gt.Const.World.LocationType <- {
	None = 0,
	Settlement = 1,
	AttachedLocation = 2,
	Lair = 4,
	Mobile = 8,
	Passive = 16,
	Inactive = 32,
	Unique = 64,
	Exploration = 128
};
gt.Const.World.LocationSettings <- {
	ZOffset = 100,
	GlobalResourcesRate = 1.0
};

