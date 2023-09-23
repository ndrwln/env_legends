this.raid_caravan_action <- this.inherit("scripts/factions/faction_action", {
	m = {
		Enemy = null
	},
	function create()
	{
		this.m.ID = "raid_caravan_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 12;
		this.m.IsStartingOnCooldown = false;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (!this.Const.DLC.Unhold)
		{
			return;
		}

		if (this.World.FactionManager.isGreaterEvil())
		{
			return;
		}

		if (!_faction.isReadyForContract())
		{
			return;
		}

		if (_faction.getPlayerRelation() <= 60)
		{
			return;
		}

		if (this.Math.rand(1, 100) > 10)
		{
			return;
		}

		if (!this.World.Ambitions.getAmbition("ambition.make_nobles_aware").isDone())
		{
			return;
		}

		local potentialEnemies = [];
		local nobles = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.NobleHouse);

		for( local i = 0; i < nobles.len(); i = ++i )
		{
			if (nobles[i].getID() == _faction.getID())
			{
			}
			else if (nobles[i].getSettlements().len() < 2)
			{
			}
			else
			{
				potentialEnemies.push(nobles[i]);
			}
		}

		if (potentialEnemies.len() == 0)
		{
			return;
		}

		this.m.Enemy = potentialEnemies[this.Math.rand(0, potentialEnemies.len() - 1)];
		this.m.Score = 1;
	}

	function onClear()
	{
		this.m.Enemy = null;
	}

	function onExecute( _faction )
	{
		local contract = this.new("scripts/contracts/contracts/raid_caravan_contract");
		contract.setFaction(_faction.getID());
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		contract.setEnemyNobleHouse(this.m.Enemy);
		this.World.Contracts.addContract(contract);
	}

});

