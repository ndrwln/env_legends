local gt = this.getroottable();

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

gt.Const.LegendMod.Formations <- {
	Count = 8
};
gt.Const.LegendMod.MaxResources <- [
	{
		Food = 300,
		Ammo = 500,
		Medicine = 200,
		ArmorParts = 200,
		Stash = 80
	},
	{
		Food = 250,
		Ammo = 250,
		Medicine = 100,
		ArmorParts = 100,
		Stash = 50
	},
	{
		Food = 200,
		Ammo = 100,
		Medicine = 50,
		ArmorParts = 50,
		Stash = 25
	},
	{
		Food = 50,
		Ammo = 50,
		Medicine = 25,
		ArmorParts = 25,
		Stash = 10
	}
];
gt.Const.LegendMod.StartResources <- [
	{
		Money = 2000,
		Ammo = 100,
		Medicine = 50,
		ArmorParts = 50
	},
	{
		Money = 1000,
		Ammo = 50,
		Medicine = 25,
		ArmorParts = 25
	},
	{
		Money = 500,
		Ammo = 25,
		Medicine = 10,
		ArmorParts = 10
	},
	{
		Money = 0,
		Ammo = 0,
		Medicine = 0,
		ArmorParts = 0
	}
];
gt.Const.LegendMod.ResourceModifiers <- {
	Ammo = [
		13,
		21,
		34,
		55,
		89
	],
	ArmorParts = [
		5,
		8,
		13,
		21,
		34,
		55
	],
	Meds = [
		8,
		13,
		21,
		34,
		55
	],
	Stash = [
		3,
		5,
		8,
		13,
		21,
		34
	],
	Healing = [
		0.0,
		0.1,
		0.3,
		0.5
	],
	Injury = [
		0.0,
		0.03,
		0.06,
		0.1
	],
	Repair = [
		0.0,
		0.1,
		0.3,
		0.5,
		1.0
	],
	Salvage = [
		0.0,
		0.1,
		0.3,
		0.5
	],
	Crafting = [
		0.0,
		0.5,
		0.75,
		1.0
	],
	Barter = [
		0.0,
		0.005,
		0.01,
		0.02,
		0.03
	],
	ToolConsumption = [
		0.0,
		0.05,
		0.1,
		0.2
	],
	MedConsumption = [
		0.0,
		0.05,
		0.1,
		0.2
	],
	Hunting = [
		0.0,
		0.1,
		0.2,
		0.3
	],
	Fletching = [
		0.0,
		0.1,
		0.2,
		0.3
	],
	Scout = [
		0.0,
		0.1,
		0.2,
		0.3
	],
	Gather = [
		0.0,
		0.3,
		0.5,
		1.0
	],
	Training = [
		0.0,
		0.1,
		0.2,
		0.3
	]
};

