this.build_undead_camp_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "build_undead_camp_action";
		this.m.IsRunOnNewCampaign = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		local settlements = _faction.getSettlements();

		if (this.World.FactionManager.isUndeadScourge() && this.World.FactionManager.getGreaterEvilStrength() >= 20.0)
		{
			if (settlements.len() > 19 + (this.Const.DLC.Desert ? 4 : 0))
			{
				return;
			}
		}
		else if (settlements.len() > 11 + (this.Const.DLC.Desert ? 4 : 0))
		{
			return;
		}

		this.m.Score = 2;

		if (this.World.Assets.getOrigin().getID() == "scenario.legends_inquisition")
		{
			this.m.Score = 10;
		}
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local camp;
		local r = this.Math.rand(1, 5 + (this.Const.DLC.Desert ? 3 : 0));

		if (r == 1)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains,
					this.Const.World.TerrainType.Desert,
					this.Const.World.TerrainType.Oasis
				], 8, 16, 1000, 7, 7, null, this.Const.DLC.Desert ? 0.2 : 0.0);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains,
					this.Const.World.TerrainType.Desert,
					this.Const.World.TerrainType.Oasis
				], 8, 16, 1000, 7, 7, null, this.Const.DLC.Desert ? 0.2 : 0.0);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_crypt_location", tile.Coords);
			}
		}
		else if (r == 2)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 12, 30, 1000, 7, 7, null, 0.0, this.Const.DLC.Desert ? 0.9 : 1.0);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 12, 1000, 1000, 7, 7, null, 0.0, this.Const.DLC.Desert ? 0.9 : 1.0);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_mass_grave_location", tile.Coords);
			}
		}
		else if (r == 3)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 8, 20);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 10, 30);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_ruins_location", tile.Coords);
			}
		}
		else if (r == 4)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 15, 25, 1000, 7, 7, null, 0.0, this.Const.DLC.Desert ? 0.9 : 1.0);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 15, 25, 1000, 7, 7, null, 0.0, this.Const.DLC.Desert ? 0.9 : 1.0);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_vampire_coven_location", tile.Coords);
			}
		}
		else if (r == 5)
		{
			local disallowTerrain = [];

			for( local i = 0; i != this.Const.World.TerrainType.COUNT; i = i )
			{
				if (i != this.Const.World.TerrainType.Snow && i != this.Const.World.TerrainType.Tundra)
				{
					disallowTerrain.push(i);
				}

				i = ++i;
			}

			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, disallowTerrain, 18, 30);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, disallowTerrain, 20, 1000);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_buried_castle_location", tile.Coords);
			}
		}
		else if (r == 6)
		{
			local disallowTerrain = [];

			for( local i = 0; i != this.Const.World.TerrainType.COUNT; i = i )
			{
				if (i == this.Const.World.TerrainType.Desert)
				{
				}
				else
				{
					disallowTerrain.push(i);
				}

				i = ++i;
			}

			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, disallowTerrain, 8, 20);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, disallowTerrain, 10, 30);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_ruins_location", tile.Coords);
			}
		}
		else if (r == 7)
		{
			local disallowTerrain = [];

			for( local i = 0; i != this.Const.World.TerrainType.COUNT; i = i )
			{
				if (i == this.Const.World.TerrainType.Desert)
				{
				}
				else
				{
					disallowTerrain.push(i);
				}

				i = ++i;
			}

			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, disallowTerrain, 11, 25, 1000, 7, 7);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, disallowTerrain, 12, 25, 1000, 7, 7);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_vampire_coven_location", tile.Coords);
			}
		}
		else if (r == 8)
		{
			local disallowTerrain = [];

			for( local i = 0; i != this.Const.World.TerrainType.COUNT; i = i )
			{
				if (i == this.Const.World.TerrainType.Desert)
				{
				}
				else
				{
					disallowTerrain.push(i);
				}

				i = ++i;
			}

			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, disallowTerrain, 11, 30, 1000, 7, 7);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, disallowTerrain, 12, 1000, 1000, 7, 7);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_mass_grave_location", tile.Coords);
			}
		}

		if (camp != null)
		{
			local banner = this.getAppropriateBanner(camp, _faction.getSettlements(), 15, this.Const.UndeadBanners);
			camp.onSpawned();
			camp.setBanner(banner);
			_faction.addSettlement(camp, false);
		}
	}

});

