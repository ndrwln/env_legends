this.unload_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {},
	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Unload;
	}

	function onExecute( _entity, _hasChanged )
	{
		foreach( settlement in this.World.getAllEntitiesAndOneLocationAtPos(_entity.getPos(), 1.0) )
		{
			if (!settlement.isLocation() || !settlement.isLocationType(this.Const.World.LocationType.Settlement) || !settlement.isEnterable())
			{
				continue;
			}

			local inv = _entity.getStashInventory().getItems();

			if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
			{
				local origin = _entity.getOrigin();

				if (origin != null)
				{
					local investment = _entity.getFlags().getAsInt("CaravanInvestment");
					local profit = _entity.getFlags().getAsInt("CaravanProfit");
					origin.addResources(investment + profit);
					this.logWarning("Unloading caravan with " + inv.len() + " items at " + settlement.getName() + ", the origin town " + origin.getName() + " receives their investment of " + investment + " resources along wiht a profit of " + profit + ", now have " + origin.getResources() + " resources in total");
				}

				foreach( item in inv )
				{
					settlement.addImportedProduce(item);
					this.logWarning("Moving \'" + item.getName() + "\' to " + settlement.getName() + "\'s marketplace");
				}

				local storage = settlement.getImportedGoodsInventory().getItems();
				local marketplace = settlement.getBuilding("building.marketplace");

				if (marketplace != null && storage.len() > ::Const.World.Common.WorldEconomy.ImportedGoodsInventorySizeMax)
				{
					local different = storage.len() - ::Const.World.Common.WorldEconomy.ImportedGoodsInventorySizeMax;
					local newStorage = [];

					foreach( i, item in storage )
					{
						if (i >= different)
						{
							newStorage.push(item);
						}
						else
						{
							marketplace.getStash().add(item);
						}
					}

					settlement.getImportedGoodsInventory().assign(newStorage);
				}
			}
			else
			{
				foreach( item in _entity.getInventory() )
				{
					settlement.addImportedProduce(item);
				}
			}

			_entity.clearInventory();
			break;
		}

		this.getController().popOrder();
		return true;
	}

});

