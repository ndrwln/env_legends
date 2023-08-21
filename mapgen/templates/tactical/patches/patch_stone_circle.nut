this.patch_stone_circle <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.stone_circle";
		this.m.MinX = 5;
		this.m.MaxX = 5;
		this.m.MinY = 5;
		this.m.MaxY = 5;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local Details = [
			"detail_bigstone_01",
			"detail_bigstone_02",
			"detail_bigstone_03",
			"detail_bigstone_04"
		];
		local tile;
		local x = _rect.X;
		local y = _rect.Y;

		if (this.Tactical.getTileSquare(x + 2, y).Level != 0)
		{
			return;
		}

		if (this.Tactical.getTileSquare(x + 1, y + 1).Level != 0)
		{
			return;
		}

		if (this.Tactical.getTileSquare(x + 3, y + 1).Level != 0)
		{
			return;
		}

		if (this.Tactical.getTileSquare(x, y + 2).Level != 0)
		{
			return;
		}

		if (this.Tactical.getTileSquare(x + 4, y + 2).Level != 0)
		{
			return;
		}

		if (this.Tactical.getTileSquare(x + 1, y + 3).Level != 0)
		{
			return;
		}

		if (this.Tactical.getTileSquare(x + 3, y + 3).Level != 0)
		{
			return;
		}

		if (this.Tactical.getTileSquare(x + 2, y + 4).Level != 0)
		{
			return;
		}

		tile.IsHidingEntity = false;
		tile = this.Tactical.getTileSquare(x + 2, y);
		tile.clear();
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile = this.Tactical.getTileSquare(x + 1, y + 1);
		tile.clear();
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile = this.Tactical.getTileSquare(x + 3, y + 1);
		tile.clear();
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile = this.Tactical.getTileSquare(x, y + 2);
		tile.clear();
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile = this.Tactical.getTileSquare(x + 4, y + 2);
		tile.clear();
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile = this.Tactical.getTileSquare(x + 1, y + 3);
		tile.clear();
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile = this.Tactical.getTileSquare(x + 3, y + 3);
		tile.clear();
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile = this.Tactical.getTileSquare(x + 2, y + 4);
		tile.clear();
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
		tile.spawnDetail(Details[this.Math.rand(0, Details.len() - 1)]);
	}

});

