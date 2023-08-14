local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.FreeCompany <- {
	Name = "FreeCompany",
	IsDynamic = true,
	MovementSpeedMult = 0.95,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_03",
	MaxR = 690,
	MinR = 97,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.FreeCompanyLeader,
			Cost = 30,
			Weight = 0
		}
	],
	Troops = [
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanySpearmanLow,
					MaxR = 250,
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanySpearman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanySlayer,
					MinR = 250,
					Cost = 22
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyFootman,
					MinR = 250,
					Cost = 22
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 8
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyArcherLow,
					MaxR = 250,
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyArcher,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyCrossbow,
					MinR = 250,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyLongbow,
					MinR = 300,
					Cost = 25
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyBillman,
					MinR = 200,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyPikeman,
					MinR = 200,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyInfantry,
					MinR = 250,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyLeader,
					MinR = 250,
					Cost = 30
				}
			]
		}
	]
};
gt.Const.World.Spawn.FreeCompanyLow <- {
	Name = "FreeCompanyLow",
	IsDynamic = true,
	MovementSpeedMult = 0.9,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_03",
	MinR = 120,
	MaxR = 225,
	MinR = 97,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.FreeCompanyLeaderLow,
			Cost = 30,
			Weight = 0
		}
	],
	Troops = [
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanySpearmanLow,
					MaxR = 250,
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanySpearman,
					Cost = 15
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 8
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyArcherLow,
					MaxR = 250,
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyArcher,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyCrossbow,
					MinR = 250,
					Cost = 15
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyPikeman,
					MinR = 200,
					Cost = 20
				}
			]
		}
	]
};
gt.Const.World.Spawn.GildedCompany <- {
	Name = "GildedCompany",
	IsDynamic = true,
	MovementSpeedMult = 0.95,
	VisibilityMult = 1,
	VisionMult = 1,
	Body = "figure_bandit_03",
	MaxR = 690,
	MinR = 97,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.FreeCompanyLeader,
			Cost = 30,
			Weight = 0
		}
	],
	Troops = [
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanySpearman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanySlayer,
					Cost = 22
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyFootman,
					Cost = 22
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 8
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyArcher,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyCrossbow,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyLongbow,
					Cost = 25
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyBillman,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyPikeman,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyInfantry,
					Cost = 25
				}
			]
		}
	]
};

