this.brewery_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Brewery";
		this.m.ID = "attached_location.brewery";
		this.m.Description = "This brewery produces large quantities of beer for both local taverns and traders. Contributes beer, brawlers, monks and gamblers to the local town";
		this.m.Sprite = "world_brewery_01";
		this.m.SpriteDestroyed = "world_brewery_01_ruins";
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
						local d = nextTile.spawnDetail("world_brewery_detail_0" + this.Math.rand(1, 2), this.Const.World.ZLevel.Object, this.Const.World.DetailType.NotCompatibleWithRoad);
						d.Scale = 0.9;
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
		_list.push("supplies/beer_item");
		_list.push("supplies/beer_item");
	}

	function onUpdateDraftList( _list, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (!this.isActive())
		{
			return;
		}

		_list.push("monk_background");
		_list.push("brawler_background");
		_list.push("gambler_background");

		if (_gender)
		{
			_list.push("legend_nun_background");
		}
	}

	function onUpdateShopList( _id, _list )
	{
		switch(_id)
		{
		case "building.marketplace":
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/beer_item"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/beer_item"
			});
			break;

		default:
			if (_id == "building.specialized_trader")
			{
			}
		}
	}

	function onInit()
	{
		this.attached_location.onInit();
		this.getSprite("body").Scale = 0.9;
	}

});

