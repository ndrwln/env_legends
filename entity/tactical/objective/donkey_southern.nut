this.donkey_southern <- this.inherit("scripts/entity/tactical/objective/donkey", {
	m = {},
	function create()
	{
		this.donkey.create();
	}

	function onPlacedOnMap()
	{
		this.actor.onPlacedOnMap();
		local directionPriority = [
			this.Const.Direction.NW,
			this.Const.Direction.NE,
			this.Const.Direction.N,
			this.Const.Direction.SW,
			this.Const.Direction.S,
			this.Const.Direction.SE
		];
		local myTile = this.getTile();
		local tile;
		local dir = -1;

		for( local i = 0; i < 6; i = ++i )
		{
			if (!myTile.hasNextTile(directionPriority[i]))
			{
			}
			else
			{
				local nextTile = myTile.getNextTile(directionPriority[i]);

				if (!nextTile.IsEmpty || this.Math.abs(nextTile.Level - myTile.Level) > 1)
				{
				}
				else
				{
					tile = nextTile;
					dir = i;
					break;
				}
			}
		}

		if (tile != null)
		{
			local cart = this.Tactical.spawnEntity("scripts/entity/tactical/objects/cart_southern", tile.Coords);

			if (directionPriority[dir] == this.Const.Direction.NE)
			{
				cart.setFlipped(true);
				this.setFlipped(true);
			}
			else if (directionPriority[dir] == this.Const.Direction.SE)
			{
				cart.setFlipped(true);
			}
		}
	}

});

