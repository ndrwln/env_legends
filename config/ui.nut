local gt = this.getroottable();
gt.Const.CharacterScreen <- {
	InventoryMode = {
		Stash = 1,
		Ground = 2,
		BattlePreparation = 3
	},
	ErrorCode = {
		Undefined = 0,
		FailedToFindEntity = 1,
		FailedToAcquireInventory = 2,
		FailedToAcquireStash = 3,
		FailedToAcquireGroundItems = 4,
		FailedToFindGroundItem = 5,
		FailedToFindStashItem = 6,
		FailedToFindBagItem = 7,
		FailedToRemoveItemFromBag = 8,
		FailedToRemoveItemFromTargetSlot = 9,
		FailedToRemoveItemFromSourceSlot = 10,
		FailedToEquipBagItem = 11,
		FailedToEquipGroundItem = 12,
		FailedToEquipStashItem = 13,
		FailedToPutItemIntoBag = 14,
		FailedToPutGroundItemIntoBag = 15,
		FailedToPutStashItemIntoBag = 17,
		ItemAlreadyWithinBag = 20,
		ItemIsNotChangableInBattle = 21,
		ItemIsNotAssignedToAnySlot = 22,
		NotEnoughActionPoints = 30,
		NotEnoughBagSpace = 31,
		NotEnoughStashSpace = 32,
		OnlyActiveEntityIsAllowedToChangeItems = 40,
		FailedToUnlockPerk = 50
	}
};
gt.Const.CharacterMaxValue <- {
	Bravery = 100,
	MeleeDefense = 100,
	RangedDefense = 100,
	MeleeSkill = 100,
	RangedSkill = 100,
	Vision = 10,
	Initiative = 120,
	Hitchance = 100,
	RegularDamage = 140,
	ArmorDamage = 200
};
gt.Const.UI <- {
	Cursor = {
		Boot = "cursor_boot",
		Denied = "cursor_denied",
		Hand = "cursor_hand",
		Hourglass = "cursor_hourglass",
		Rotate = "cursor_rotate",
		Sword = "cursor_sword",
		Attack = "cursor_attack",
		Scroll = "cursor_scroll",
		Drink = "cursor_drink",
		Give = "cursor_give",
		Bandage = "cursor_bandages",
		Rotation = "cursor_rotation",
		Enter = "cursor_enter"
	},
	Color = {
		PositiveValue = "#135213",
		NegativeValue = "#8f1e1e",
		DamageValue = "#8f1e1e",
		PositiveEventValue = "#1e861e",
		NegativeEventValue = "#a22424",
		RuneColor = "#bf2aac"
	},
	function getColorizedEntityName( _entity )
	{
		if (_entity.isPlayerControlled() || _entity.getFaction() == this.Const.Faction.PlayerAnimals)
		{
			return "[color=#1e468f]" + _entity.getName() + "[/color]";
		}
		else
		{
			return "[color=#8f1e1e]" + _entity.getName() + "[/color]";
		}
	}

	function getColorized( _string, _color )
	{
		return "[color=" + _color + "]" + _string + "[/color]";
	}

	Error = {
		Undefined = 0,
		RosterEntryNotFound = 1,
		NotEnoughMoney = 10,
		NotEnoughRosterSpace = 11,
		NotEnoughStashSpace = 12,
		FoundLootListIsEmpty = 13
	},
	ItemOwner = {
		Stash = 0,
		Shop = 1,
		Ground = 2,
		Bag = 3,
		Paperdoll = 4,
		Loot = 5,
		Entity = 6
	},
	function convertErrorToUIData( _errorCode )
	{
		return {
			error = _errorCode
		};
	}

};

