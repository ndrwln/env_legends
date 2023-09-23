this.moss1 <- this.inherit("scripts/mapgen/tactical_template", {
	m = {
		DetailsA = [
			"detail_forest_01",
			"detail_forest_02",
			"detail_forest_03",
			"detail_forest_04",
			"detail_forest_05",
			"detail_forest_06",
			"detail_forest_07",
			"moss_details_01",
			"moss_details_02",
			"moss_details_03"
		],
		DetailsB = [
			"detail_mushrooms_01",
			"detail_mushrooms_02",
			"detail_mushrooms_03",
			"detail_mushrooms_04",
			"detail_mushrooms_05",
			"detail_grass_00",
			"detail_grass_01",
			"detail_grass_02",
			"detail_grass_03",
			"detail_grass_04",
			"detail_grass_05",
			"moss_details_01",
			"moss_details_02",
			"moss_details_03"
		],
		Bugs = [
			"detail_bugs_01",
			"detail_bugs_02",
			"detail_bugs_03"
		],
		Shadows = [
			"detail_forest_shadow_01",
			"detail_forest_shadow_02",
			"detail_forest_shadow_03"
		],
		FlowerDetails = [
			"detail_flowerstuff_01",
			"detail_flowerstuff_02",
			"detail_flowerstuff_03",
			"detail_flowerstuff_04",
			"detail_flowerstuff_04b"
		],
		HidingFront = "hiding_ferns_01_front",
		HidingBack = "hiding_ferns_01_back",
		HidingExtras = [
			"detail_forest_07",
			"detail_forest_08",
			"detail_forest_08b",
			"detail_forest_08c",
			"detail_forest_09",
			"detail_forest_10",
			"detail_forest_11",
			"hiding_ferns_01_front"
		],
		ChanceToSpawnDetails = 44,
		ChanceToSpawnBugs = 5,
		ChanceToSpawnShadow = 33,
		ChanceToSpawnHiding = 6,
		ChanceToSpawnHidingExtra = 50,
		ChanceToSpawnHidingVicinityBonus = 15,
		LimitOfSpawnedDetails = 4,
		Lightshaft = "detail_lightshaft_01",
		ChanceToSpawnLightshaft = 8,
		Objects = [
			"entity/tactical/objects/boulder_forest",
			"entity/tactical/objects/brush_forest",
			"entity/tactical/objects/brush_forest",
			"entity/tactical/objects/tree_trunk_forest",
			"entity/tactical/objects/tree_needle1",
			"entity/tactical/objects/tree_needle1",
			"entity/tactical/objects/tree_needle2"
		],
		ChanceToSpawnObject = 8
	},
	function init()
	{
		this.m.Name = "tactical.tile.moss1";
		this.m.MinX = 1;
		this.m.MinY = 1;
		local t = this.createTileTransition();
		t.setBlendIntoSockets(false);
		t.setBrush(this.Const.Direction.N, "transition_moss_01_N");
		t.setBrush(this.Const.Direction.NE, "transition_moss_01_NE");
		t.setBrush(this.Const.Direction.SE, "transition_moss_01_SE");
		t.setBrush(this.Const.Direction.S, "transition_moss_01_S");
		t.setBrush(this.Const.Direction.SW, "transition_moss_01_SW");
		t.setBrush(this.Const.Direction.NW, "transition_moss_01_NW");
		t.setSocket("socket_earth");
		this.Tactical.setTransitions("tile_moss_01", t);
	}

	function fillWithFern( _rect, _properties, _pass = 1 )
	{
		local chance = this.m.ChanceToSpawnHiding;
		this.m.ChanceToSpawnHiding = chance * 5;
		this.fill(_rect, _properties, _pass);
		this.m.ChanceToSpawnHiding = chance;
	}

	function fillWithMushrooms( _rect, _properties, _pass = 1 )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		tile.Type = this.Const.Tactical.TerrainType.Forest;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.Forest;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Forest;
		tile.setBrush("tile_moss_0" + this.Math.rand(1, 2));
		local r = this.Math.rand(1, 100);

		if (r < 20)
		{
			tile.spawnDetail(this.m.DetailsB[this.Math.rand(0, this.m.DetailsB.len() - 1)]);
		}

		if (r < 40)
		{
			tile.spawnDetail(this.m.DetailsB[this.Math.rand(0, this.m.DetailsB.len() - 1)]);
		}

		if (r < 60)
		{
			tile.spawnDetail(this.m.DetailsB[this.Math.rand(0, this.m.DetailsB.len() - 1)]);
		}

		if (r < 80)
		{
			tile.spawnDetail(this.m.DetailsB[this.Math.rand(0, this.m.DetailsB.len() - 1)]);
		}

		if (this.Math.rand(1, 100) < this.m.ChanceToSpawnLightshaft)
		{
			tile.spawnDetail(this.m.Lightshaft);
		}
	}

	function onFirstPass( _rect, _objectSpawnChanceMult = 1.0 )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		local v = this.Math.rand(1, 2);
		tile.Type = this.Const.Tactical.TerrainType.Forest;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.Forest;
		tile.BlendPriority = v == 1 ? this.Const.Tactical.TileBlendPriority.Moss1 : this.Const.Tactical.TileBlendPriority.Moss2;
		tile.setBrush("tile_moss_0" + v);
		local n = 0;

		if (!_rect.IsEmpty && this.Math.rand(1, 100) < this.m.ChanceToSpawnObject * _objectSpawnChanceMult)
		{
			local isIsolated = true;

			for( local i = 0; i != 6; i = ++i )
			{
				if (!tile.hasNextTile(i))
				{
				}
				else if (!tile.getNextTile(i).IsEmpty)
				{
					isIsolated = false;
					break;
				}
			}

			if (isIsolated)
			{
				tile.spawnObject(this.m.Objects[this.Math.rand(0, this.m.Objects.len() - 1)]);
			}
		}
		else
		{
			local h = 0;

			if (this.Tactical.isValidTileSquare(_rect.X - 1, _rect.Y) && this.Tactical.getTileSquare(_rect.X - 1, _rect.Y).IsHidingEntity)
			{
				h = ++h;
			}

			if (this.Tactical.isValidTileSquare(_rect.X - 1, _rect.Y + 1) && this.Tactical.getTileSquare(_rect.X - 1, _rect.Y + 1).IsHidingEntity)
			{
				h = ++h;
			}

			if (this.Tactical.isValidTileSquare(_rect.X, _rect.Y - 1) && this.Tactical.getTileSquare(_rect.X, _rect.Y - 1).IsHidingEntity)
			{
				h = ++h;
			}

			if (this.Math.rand(1, 100) < this.m.ChanceToSpawnHiding + h * this.m.ChanceToSpawnHidingVicinityBonus)
			{
				tile.spawnDetail(this.m.HidingBack);
				tile.spawnDetail(this.m.HidingFront);

				if (this.Math.rand(1, 100) < this.m.ChanceToSpawnHidingExtra)
				{
					tile.spawnDetail(this.m.HidingExtras[this.Math.rand(0, this.m.HidingExtras.len() - 1)]);
				}

				tile.IsHidingEntity = true;
			}
			else
			{
				local details = this.Math.rand(1, 100) < 45 ? this.m.DetailsA : this.m.DetailsB;
				local decalSpawned = false;

				if (this.Math.rand(1, 100) < this.m.ChanceToSpawnShadow)
				{
					tile.spawnDetail(this.m.Shadows[this.Math.rand(0, this.m.Shadows.len() - 1)]);
				}

				while (this.Math.rand(1, 100) < this.m.ChanceToSpawnDetails && n++ < this.m.LimitOfSpawnedDetails)
				{
					tile.spawnDetail(details[this.Math.rand(0, details.len() - 1)]);
					decalSpawned = true;
				}

				if (decalSpawned && this.Math.rand(1, 100) < this.m.ChanceToSpawnBugs)
				{
					for( local i = 0; i < this.m.Bugs.len(); i = ++i )
					{
						tile.spawnDetail(this.m.Bugs[i]);
					}
				}

				local h = 0;

				if (this.Tactical.isValidTileSquare(_rect.X - 1, _rect.Y) && this.Tactical.getTileSquare(_rect.X - 1, _rect.Y).IsSpecialTerrain)
				{
					h = ++h;
				}

				if (this.Tactical.isValidTileSquare(_rect.X - 1, _rect.Y + 1) && this.Tactical.getTileSquare(_rect.X - 1, _rect.Y + 1).IsSpecialTerrain)
				{
					h = ++h;
				}

				if (this.Tactical.isValidTileSquare(_rect.X, _rect.Y - 1) && this.Tactical.getTileSquare(_rect.X, _rect.Y - 1).IsSpecialTerrain)
				{
					h = ++h;
				}

				if (this.Math.rand(1, 100) < h * this.m.ChanceToSpawnLightshaft)
				{
					tile.spawnDetail(this.m.Lightshaft);

					if (this.Math.rand(1, 100) <= 50)
					{
						for( local i = 0; i < this.m.FlowerDetails.len(); i = ++i )
						{
							tile.spawnDetail(this.m.FlowerDetails[i]);
						}
					}
				}
			}
		}
	}

	function onSecondPass( _rect )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);
		local h = 0;

		if (tile.IsHidingEntity)
		{
			return;
		}

		if (tile.hasNextTile(this.Const.Direction.SW) && tile.getNextTile(this.Const.Direction.SW).IsHidingEntity)
		{
			h = ++h;
		}

		if (tile.hasNextTile(this.Const.Direction.NE) && tile.getNextTile(this.Const.Direction.NE).IsHidingEntity)
		{
			h = ++h;
		}

		if (tile.hasNextTile(this.Const.Direction.NW) && tile.getNextTile(this.Const.Direction.NW).IsHidingEntity)
		{
			h = ++h;
		}

		if (tile.hasNextTile(this.Const.Direction.SE) && tile.getNextTile(this.Const.Direction.SE).IsHidingEntity)
		{
			h = ++h;
		}

		if (tile.hasNextTile(this.Const.Direction.N) && tile.getNextTile(this.Const.Direction.N).IsHidingEntity)
		{
			h = ++h;
		}

		if (tile.hasNextTile(this.Const.Direction.S) && tile.getNextTile(this.Const.Direction.S).IsHidingEntity)
		{
			h = ++h;
		}

		if (h != 0)
		{
			tile.clear();

			if (h * this.m.ChanceToSpawnHidingVicinityBonus >= 100)
			{
				tile.spawnDetail(this.m.HidingBack);
				tile.spawnDetail(this.m.HidingFront);
				tile.IsHidingEntity = true;
			}
			else
			{
				local n = 2;

				for( local hi = 0; hi < n; hi = ++hi )
				{
					tile.spawnDetail(this.m.HidingExtras[this.Math.rand(0, this.m.HidingExtras.len() - 1)]);
				}
			}
		}
	}

});

