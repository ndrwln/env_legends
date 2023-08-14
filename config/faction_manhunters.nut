local gt = this.getroottable();

if (!("Tactical" in gt.Const))
{
	gt.Const.Tactical <- {};
}

if (!("Actor" in gt.Const.Tactical))
{
	gt.Const.Tactical.Actor <- {};
}

gt.Const.Tactical.Actor.SatoManhunter <- {
	XP = 225,
	ActionPoints = 9,
	Hitpoints = 80,
	Bravery = 60,
	Stamina = 110,
	MeleeSkill = 75,
	RangedSkill = 55,
	MeleeDefense = 15,
	RangedDefense = 10,
	Initiative = 125,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 18
};
gt.Const.Tactical.Actor.SatoManhunterVeteran <- {
	XP = 350,
	ActionPoints = 9,
	Hitpoints = 105,
	Bravery = 70,
	Stamina = 115,
	MeleeSkill = 75,
	RangedSkill = 55,
	MeleeDefense = 20,
	RangedDefense = 10,
	Initiative = 150,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 18
};
gt.Const.Tactical.Actor.SatoManhunterRanged <- {
	XP = 200,
	ActionPoints = 9,
	Hitpoints = 60,
	Bravery = 65,
	Stamina = 105,
	MeleeSkill = 50,
	RangedSkill = 70,
	MeleeDefense = 10,
	RangedDefense = 15,
	Initiative = 90,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 18
};
gt.Const.Tactical.Actor.SatoManhunterVeteranRanged <- {
	XP = 350,
	ActionPoints = 9,
	Hitpoints = 75,
	Bravery = 75,
	Stamina = 125,
	MeleeSkill = 55,
	RangedSkill = 75,
	MeleeDefense = 10,
	RangedDefense = 15,
	Initiative = 105,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 18
};

