this.forest1 <- this.inherit("scripts/mapgen/tactical_template", {
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
			"detail_grass_03",
			"detail_grass_04",
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
		ChanceToSpawnDetails = 50,
		ChanceToSpawnBugs = 5,
		ChanceToSpawnShadow = 33,
		ChanceToSpawnHiding = 6,
		ChanceToSpawnHidingExtra = 50,
		ChanceToSpawnHidingVicinityBonus = 20,
		LimitOfSpawnedDetails = 4,
		Lightshaft = "detail_lightshaft_01",
		ChanceToSpawnLightshaft = 5,
		Objects = [
			"entity/tactical/objects/boulder_forest",
			"entity/tactical/objects/brush_forest",
			"entity/tactical/objects/brush_forest",
			"entity/tactical/objects/tree_trunk_forest",
			"entity/tactical/objects/tree_trunk_forest",
			"entity/tactical/objects/tree_needle1",
			"entity/tactical/objects/tree_needle1"
		],
		ObjectsTreesSmall = [
			"entity/tactical/objects/tree_needle2_smaller"
		],
		ObjectsTrees = [
			"entity/tactical/objects/tree_needle2"
		],
		ChanceToSpawnObject = 25
	},
	function init()
	{
		this.m.Name = "tactical.tile.forest1";
		this.m.MinX = 1;
		this.m.MinY = 1;
		local t = this.createTileTransition();
		t.setBlendIntoSockets(false);
		t.setBrush(this.Const.Direction.N, "transition_forest_01_N");
		t.setBrush(this.Const.Direction.NE, "transition_forest_01_NE");
		t.setBrush(this.Const.Direction.SE, "transition_forest_01_SE");
		t.setBrush(this.Const.Direction.S, "transition_forest_01_S");
		t.setBrush(this.Const.Direction.SW, "transition_forest_01_SW");
		t.setBrush(this.Const.Direction.NW, "transition_forest_01_NW");
		t.setSocket("socket_earth");
		this.Tactical.setTransitions("tile_forest_01", t);
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
		tile.setBrush("tile_forest_01");
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

		tile.Type = this.Const.Tactical.TerrainType.Forest;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.Forest;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Forest;
		tile.setBrush("tile_forest_01");
		local n = 0;

		if (!("IsSmallTree" in _rect))
		{
			_rect.IsSmallTree <- false;
		}

		if (!("IsTreeAllowed" in _rect))
		{
			_rect.IsTreeAllowed <- false;
		}

		if (!_rect.IsEmpty && this.Math.rand(1, 100) < this.m.ChanceToSpawnObject * _objectSpawnChanceMult)
		{
			if (_rect.IsSmallTree)
			{
				tile.spawnObject(this.m.ObjectsTreesSmall[this.Math.rand(0, this.m.ObjectsTreesSmall.len() - 1)]);

				if (this.Math.rand(1, 100) <= 33)
				{
					for( local details = this.Math.rand(1, 100) < 45 ? this.m.DetailsA : this.m.DetailsB; this.Math.rand(1, 100) < this.m.ChanceToSpawnDetails && n++ < this.m.LimitOfSpawnedDetails;  )
					{
						tile.spawnDetail(details[this.Math.rand(0, details.len() - 1)]);
					}
				}
			}
			else if (_rect.IsTreeAllowed)
			{
				tile.spawnObject(this.m.ObjectsTrees[this.Math.rand(0, this.m.ObjectsTrees.len() - 1)]);
			}
			else
			{
				tile.spawnObject(this.m.Objects[this.Math.rand(0, this.m.Objects.len() - 1)]);
			}

			tile.IsSpecialTerrain = true;

			if (this.Math.rand(1, 100) <= 90)
			{
				if (this.Math.rand(1, 100) <= 50)
				{
					tile.spawnDetail("hiding_shrubbery_01_front");
				}
				else
				{
					tile.spawnDetail("forest_roots_0" + this.Math.rand(1, 3));
				}
			}
		}

		local h = 0;

		if (this.Tactical.isValidTileSquare(_rect.X - 1, _rect.Y) && this.Tactical.getTileSquare(_rect.X - 1, _rect.Y).IsHidingEntity)
		{
			h = ++h;
			h = h;
		}

		if (this.Tactical.isValidTileSquare(_rect.X - 1, _rect.Y + 1) && this.Tactical.getTileSquare(_rect.X - 1, _rect.Y + 1).IsHidingEntity)
		{
			h = ++h;
			h = h;
		}

		if (this.Tactical.isValidTileSquare(_rect.X, _rect.Y - 1) && this.Tactical.getTileSquare(_rect.X, _rect.Y - 1).IsHidingEntity)
		{
			h = ++h;
			h = h;
		}

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
			for( local i = 0; i < this.m.Bugs.len(); i = i )
			{
				tile.spawnDetail(this.m.Bugs[i]);
				i = ++i;
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
			h = h;
		}

		if (tile.hasNextTile(this.Const.Direction.NE) && tile.getNextTile(this.Const.Direction.NE).IsHidingEntity)
		{
			h = ++h;
			h = h;
		}

		if (tile.hasNextTile(this.Const.Direction.NW) && tile.getNextTile(this.Const.Direction.NW).IsHidingEntity)
		{
			h = ++h;
			h = h;
		}

		if (tile.hasNextTile(this.Const.Direction.SE) && tile.getNextTile(this.Const.Direction.SE).IsHidingEntity)
		{
			h = ++h;
			h = h;
		}

		if (tile.hasNextTile(this.Const.Direction.N) && tile.getNextTile(this.Const.Direction.N).IsHidingEntity)
		{
			h = ++h;
			h = h;
		}

		if (tile.hasNextTile(this.Const.Direction.S) && tile.getNextTile(this.Const.Direction.S).IsHidingEntity)
		{
			h = ++h;
			h = h;
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

				for( local hi = 0; hi < n; hi = hi )
				{
					tile.spawnDetail(this.m.HidingExtras[this.Math.rand(0, this.m.HidingExtras.len() - 1)]);
					hi = ++hi;
				}
			}
		}
	}

});

