this.patch_ritual_site <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.ritual_site";
		this.m.MinX = 3;
		this.m.MaxX = 3;
		this.m.MinY = 3;
		this.m.MaxY = 3;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local grassTile = this.MapGen.get("tactical.tile.grass2");
		local earthTile = this.MapGen.get("tactical.tile.earth1");
		local forestTile = this.MapGen.get("tactical.tile.forest1");
		local mainTile = forestTile;
		local otherTile = grassTile;
		local otherTileChance = this.Math.rand(5, 10);

		if (mainTile == earthTile)
		{
			otherTileChance = otherTileChance + 20;
		}

		local placedPillar = false;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (tile.Type != 0)
				{
				}
				else
				{
					if (x == _rect.X || x == _rect.X + _rect.W - 1 || y == _rect.Y || y == _rect.Y + _rect.H - 1)
					{
						if (this.Math.rand(0, 100) < 25)
						{
						}
					}

					local brush = this.Math.rand(0, 100) < otherTileChance ? otherTile : mainTile;
					brush.fill({
						X = x,
						Y = y,
						W = 1,
						H = 1,
						IsEmpty = true
					}, _properties);

					if (tile.IsEmpty)
					{
						if (!placedPillar && this.Math.rand(1, 100) < 33)
						{
							tile.spawnObject("entity/tactical/objects/boulder_bloody");
							placedPillar = true;
						}

						if (this.Math.rand(1, 100) < 60)
						{
							tile.spawnDetail("corpse_part_0" + this.Math.rand(1, 5));
						}

						if (this.Math.rand(1, 100) < 60)
						{
							tile.spawnDetail(this.Const.BloodDecals[this.Const.BloodType.Red][this.Math.rand(0, this.Const.BloodDecals[this.Const.BloodType.Red].len() - 1)]);
						}
					}
				}
			}
		}
	}

});

