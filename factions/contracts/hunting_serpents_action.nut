this.hunting_serpents_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "hunting_serpents_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 12;
		this.m.IsStartingOnCooldown = false;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (!this.Const.DLC.Desert)
		{
			return;
		}

		if (!_faction.isReadyForContract())
		{
			return;
		}

		if (this.World.Assets.getBusinessReputation() < 450)
		{
			return;
		}

		if (this.World.getTime().Days <= 5 || this.Math.rand(1, 100) > 30)
		{
			return;
		}

		local village = _faction.getSettlements()[0];

		if (!this.isKindOf(village, "city_state"))
		{
			return;
		}

		local mapSize = this.World.getMapSize();
		local villageTile = village.getTile();
		local x = this.Math.max(3, villageTile.SquareCoords.X - 12);
		local x_max = this.Math.min(mapSize.X - 3, villageTile.SquareCoords.X + 12);
		local y = this.Math.max(3, villageTile.SquareCoords.Y - 12);
		local y_max = this.Math.min(mapSize.Y - 3, villageTile.SquareCoords.Y + 12);
		local numOasis = 0;

		while (x <= x_max)
		{
			while (y <= y_max)
			{
				local tile = this.World.getTileSquare(x, y);
				local d = villageTile.getDistanceTo(tile);

				if (d >= 5 && d <= 14 && tile.Type == this.Const.World.TerrainType.Oasis)
				{
					numOasis = ++numOasis;
					break;
				}

				y = ++y;
			}

			x = ++x;
		}

		if (numOasis == 0)
		{
			return;
		}

		this.m.Score = 1;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local contract = this.new("scripts/contracts/contracts/hunting_serpents_contract");
		contract.setFaction(_faction.getID());
		contract.setHome(_faction.getSettlements()[0]);
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		this.World.Contracts.addContract(contract);
	}

});

