local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

gt.Const.World.Assets <- {
	NewCampaignEquipment = [
		"scripts/items/accessory/bandage_item"
	],
	MedicinePerHitpoint = 0.13,
	MedicinePerInjuryDay = 1.0,
	HitpointsPerHour = 0.75,
	ArmorPartsPerArmor = 0.067,
	ArmorPerHour = 2,
	FoodConsumptionMult = 1.5 / this.World.getTime().SecondsPerDay,
	CostToRepairPerPoint = 2,
	ReputationOnVictory = 5,
	ReputationOnVictoryVSLocation = 10,
	ReputationOnLoss = -15,
	ReputationOnContractCancel = -100,
	ReputationOnContractSuccess = 25,
	ReputationOnContractPoor = -25,
	ReputationOnContractFail = -75,
	ReputationOnContractBetrayal = -200,
	ReputationOnAmbition = 100,
	ReputationOnOathAmbition = 50,
	ReputationOnOathBonusObjective = 100,
	ReputationOnArenaCancel = -50,
	ReputationDaily = -3,
	RelationDecayPerDayCivilian = 0.25,
	RelationDecayPerDayNoble = 0.25,
	RelationContractCancel = -10.0,
	RelationContractCancelAdvance = -10.0,
	RelationCivilianContractSuccess = 10.0,
	RelationCivilianContractPoor = 5.0,
	RelationCivilianContractFail = -20.0,
	RelationNobleContractSuccess = 5.0,
	RelationNobleContractPoor = 2.5,
	RelationNobleContractFail = -10.0,
	RelationContractNegotiationsFail = -2.5,
	RelationAttacked = -30.0,
	RelationBetrayal = -100.0,
	RelationMajorOffense = -30.0,
	RelationOffense = -20.0,
	RelationMinorOffense = -10.0,
	RelationFavor = 15.0,
	RelationUnitKilled = -0.5,
	RelationTimeOut = 10.0 * this.World.getTime().SecondsPerDay,
	ContractRewardPOW = 1.3,
	BaseBuyPrice = 1.0,
	BaseSellPrice = 0.15,
	BaseLootSellPrice = 0.95,
	SellPriceNotProducedHere = 1.01,
	BuyPriceNotProducedHere = 1.5,
	BuyPriceNotLocalCulture = 1.5,
	SellPriceNotLocalCulture = 1.1,
	BaseWoundTreatmentPrice = 20
};
gt.Const.World.InventoryUpgradeCosts <- [
	5000,
	10000,
	20000
];

