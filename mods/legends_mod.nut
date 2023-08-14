this.legends_mod <- {
	m = {
		Configs = null
	},
	function create()
	{
		this.m.Configs = this.new("scripts/mods/legends_configs");
	}

	function Configs()
	{
		return this.m.Configs;
	}

	function onDevConsole( _command, _args )
	{
		if (_command == "event")
		{
			this.doDevConsoleEvent(_args);
		}
		else
		{
		}
	}

	function doDevConsoleEvent( _args )
	{
		if (!this.World.Events.canFireEvent())
		{
			this.logInfo("Can not fire event " + _args + " at this time");
			return;
		}

		this.World.Events.fire(_args);
	}

};

