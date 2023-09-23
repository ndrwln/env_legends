this.idle_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "idle_action";
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		this.m.Score = 10;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
	}

});

