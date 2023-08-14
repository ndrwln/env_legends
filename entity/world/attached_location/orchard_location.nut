this.orchard_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Orchard";
		this.m.ID = "attached_location.orchard";
		this.m.Description = "Dense rows of trees with ripe fruit frame a small warehouse where everything is stored until offered on local markets. Contributes fruit, blades and laborers to the local town.";
		this.m.Sprite = "world_orchard_01";
		this.m.SpriteDestroyed = "world_orchard_01_ruins";
	}

	function onBuild()
	{
		local myTile = this.getTile();
		local num = 0;

		for( local i = 0; i != 6; i = i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = myTile.getNextTile(i);

				if (nextTile.IsOccupied || nextTile.HasRoad)
				{
				}
				else if (nextTile.Type != this.Const.World.TerrainType.Plains && nextTile.Type != this.Const.World.TerrainType.Tundra && nextTile.Type != this.Const.World.TerrainType.Steppe)
				{
				}
				else
				{
					if (this.Math.rand(1, 100) <= 50)
					{
						nextTile.clear();
						nextTile.spawnDetail("world_orchard_detail_0" + this.Math.rand(1, 2), this.Const.World.ZLevel.Object, this.Const.World.DetailType.NotCompatibleWithRoad);
						num = ++num;
						num = num;
					}

					if (num >= 2)
					{
						break;
					}
				}
			}

			i = ++i;
		}

		return true;
	}

	function onUpdateProduce( _list )
	{
		_list.push("supplies/legend_fresh_fruit_item");
		_list.push("supplies/dried_fruits_item");
	}

	function onUpdateDraftList( _list, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (!this.isActive())
		{
			return;
		}

		_list.push("daytaler_background");
		_list.push("farmhand_background");
		_list.push("daytaler_background");
		_list.push("farmhand_background");
	}

	function onUpdateShopList( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/dried_fruits_item"
			});
			_list.push({
				R = 0,
				P = 0.9,
				S = "supplies/legend_fresh_fruit_item"
			});
			_list.push({
				R = 0,
				P = 0.9,
				S = "supplies/legend_fresh_fruit_item"
			});
			_list.push({
				R = 10,
				P = 0.9,
				S = "supplies/legend_pie_item"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "helmets/hood"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/scramasax"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/legend_shiv"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/legend_sickle"
			});
		}
	}

});

