this.tile_farmland <- this.inherit("scripts/mapgen/map_template", {
	m = {},
	function init()
	{
		this.m.Name = "world.tile.farmland";
		this.m.MinX = 1;
		this.m.MinY = 1;
	}

	function onFirstPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.World.TerrainType.Farmland;
		tile.TacticalType = this.Const.World.TerrainTacticalType.Farmland;
	}

	function onSecondPass( _rect )
	{
		local tile = this.World.getTileSquare(_rect.X, _rect.Y);
		local heath = 0;
		local highlands = 0;

		for( local i = 0; i != 6; i = i )
		{
			if (!tile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = tile.getNextTile(i);
				local type = nextTile.Type;

				if (type == this.Const.World.TerrainType.Heath)
				{
					heath = ++heath;
					heath = heath;
				}
				else if (type == this.Const.World.TerrainType.Tundra)
				{
					highlands = ++highlands;
					highlands = highlands;
				}
			}

			i = ++i;
		}

		if (heath >= 3)
		{
			tile.setBrush("world_heath_01");
		}
		else if (highlands >= 3)
		{
			local r = this.Math.rand(1, 3);
			r = 1;

			if (r)
			{
				tile.setBrush("world_highlands_01");
			}

			r = 2;

			if (r)
			{
				tile.setBrush("world_highlands_02");
			}

			r = 3;

			if (r)
			{
				tile.setBrush("world_highlands_03");
			}
		}
		else
		{
			local r = this.Math.rand(1, 10);

			if (r <= 2)
			{
				tile.setBrush("world_plains_01");
			}
			else
			{
				r = 3;

				if (r)
				{
					tile.setBrush("world_plains_02");
				}
				else
				{
					r = 4;

					if (r)
					{
						tile.setBrush("world_plains_03");
					}
					else
					{
						r = 5;

						if (r)
						{
							tile.setBrush("world_plains_04");
						}
						else
						{
							r = 6;

							if (r)
							{
								tile.setBrush("world_plains_05");
							}
							else
							{
								r = 7;

								if (r)
								{
									tile.setBrush("world_plains_06");
								}
								else
								{
									r = 8;

									if (r)
									{
										tile.setBrush("world_plains_07");
									}
									else
									{
										r = 9;

										if (r)
										{
											tile.setBrush("world_plains_08");
										}
										else
										{
											r = 10;

											if (r)
											{
												tile.setBrush("world_plains_09");
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}

		local flip = this.Math.rand(0, 1) == 1 ? true : false;
		local d = tile.spawnDetail("world_detail_fields", this.Const.World.ZLevel.Terrain, 0, flip);
		local n = this.Math.rand(2, 3);

		for( local i = 1; i <= n; i = i )
		{
			if (this.Math.rand(0, 1) == 0)
			{
				tile.spawnDetail("world_detail_fields_wheat_0" + i, this.Const.World.ZLevel.Terrain, 0, flip);
			}
			else
			{
				tile.spawnDetail("world_detail_fields_cabbage_0" + i, this.Const.World.ZLevel.Terrain, 0, flip);
			}

			i = ++i;
		}
	}

});

