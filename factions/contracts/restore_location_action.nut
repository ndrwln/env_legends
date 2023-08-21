this.restore_location_action <- this.inherit("scripts/factions/faction_action", {
	m = {
		Location = null
	},
	function create()
	{
		this.m.ID = "restore_location_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 11;
		this.m.IsStartingOnCooldown = false;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (!_faction.isReadyForContract())
		{
			return;
		}

		if (!this.Const.DLC.Unhold)
		{
			return;
		}

		if (_faction.getSettlements()[0].hasSituation("situation.rebuilding_effort"))
		{
			return;
		}

		this.m.Location = null;

		foreach( a in _faction.getSettlements()[0].getAttachedLocations() )
		{
			if (!a.isActive() && a.isUsable() && a.getTile().getDistanceTo(_faction.getSettlements()[0].getTile()) >= 4)
			{
				this.m.Location = a;
				break;
			}
		}

		if (this.m.Location == null)
		{
			return;
		}

		this.m.Score = 1;
	}

	function onClear()
	{
		this.m.Location = null;
	}

	function onExecute( _faction )
	{
		local contract = this.new("scripts/contracts/contracts/restore_location_contract");
		contract.setFaction(_faction.getID());
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		contract.setLocation(this.m.Location);
		this.World.Contracts.addContract(contract);
	}

});

