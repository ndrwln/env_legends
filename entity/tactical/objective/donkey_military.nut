this.donkey_military <- this.inherit("scripts/entity/tactical/objective/donkey", {
	m = {},
	function create()
	{
		this.donkey.create();
	}

	function onInit()
	{
		this.donkey.onInit();
		this.m.Skills.add(this.new("scripts/skills/active/legend_donkey_kick"));

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_muscularity"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_steadfast"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_stalwart"));
		}

		this.m.Skills.update();
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

		for( local i = 0; i < 6; i = i )
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

			i = ++i;
		}

		if (tile != null)
		{
			local cart = this.Tactical.spawnEntity("scripts/entity/tactical/objects/cart_military", tile.Coords);

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

