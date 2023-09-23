local gt = this.getroottable();
gt.Const.FreeCompanyDefaultLootTable <- [
	"trade/amber_shards_item",
	"trade/furs_item",
	"trade/tin_ingots_item",
	"trade/spices_item",
	"trade/silk_item",
	"trade/peat_bricks_item",
	"trade/cloth_rolls_item"
];
gt.Const.FreeCompanyCoordinationList <- [
	{
		ID = "Default",
		Names = this.Const.Strings.FreeCompanyNames,
		Description = "An ordinary mercenary company, out for their own crowns.",
		FootprintsType = "Mercenaries",
		Spawn = "FreeCompany",
		LootTable = clone this.Const.FreeCompanyDefaultLootTable,
		UnitOutfits = []
	}
];
gt.Const.FreeCompanyOneTimeList <- [
	{
		ID = "Gilded",
		Names = [
			"Gilded Wraiths"
		],
		Spawn = "GildedCompany",
		UnitOutfits = [
			{
				Type = this.Const.EntityType.FreeCompanyLeader,
				Outfits = [
					"mercenary_leader_outfit_gilded_00"
				]
			}
		]
	}
];

