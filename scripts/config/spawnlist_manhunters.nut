local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.SatoManhunters <- {
	Name = "SatoManhunters",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_nomad_01",
	MaxR = 530,
	MinR = 55,
	Troops = [
		{
			Weight = 60,
			Types = [
				{
					MaxR = 380,
					Type = this.Const.World.Spawn.Troops.SatoManhunter,
					Cost = 15
				},
				{
					MinR = 220,
					Type = this.Const.World.Spawn.Troops.SatoManhunterVeteran,
					Cost = 20
				}
			]
		},
		{
			Weight = 40,
			Types = [
				{
					MaxR = 400,
					Type = this.Const.World.Spawn.Troops.SatoManhunterRanged,
					Cost = 20
				},
				{
					MinR = 240,
					Type = this.Const.World.Spawn.Troops.SatoManhunterVeteranRanged,
					Cost = 28
				}
			]
		}
	]
};

