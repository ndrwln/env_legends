this.ai_pickup_weapon <- this.inherit("scripts/ai/tactical/behavior", {
	m = {},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.PickupWeapon;
		this.m.Order = this.Const.AI.Behavior.Order.PickupWeapon;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];

		if (_entity.getActionPoints() < this.Const.Tactical.Settings.SwitchItemAPCost)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.isArmed())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local myTile = _entity.getTile();
		local items = myTile.Items;

		if (items.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local isOffhandFree = _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) == null;
		local candidates = [];

		foreach( item in items )
		{
			if (item.isItemType(this.Const.Items.ItemType.MeleeWeapon) && (isOffhandFree || item.getBlockedSlotType() == null))
			{
				candidates.push(item);
			}
		}

		if (candidates.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.PickupWeapon;
	}

	function onExecute( _entity )
	{
		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Picking up melee weapon!");
		}

		_entity.pickupMeleeWeaponAndShield(_entity.getTile());
		_entity.getItems().payForAction([]);
		return true;
	}

});

