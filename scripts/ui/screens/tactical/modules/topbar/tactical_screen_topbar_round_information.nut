this.tactical_screen_topbar_round_information <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		OnQueryRoundInformationListener = null
	},
	function setOnQueryRoundInformationListener( _listener )
	{
		this.m.OnQueryRoundInformationListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnQueryRoundInformationListener = null;
	}

	function create()
	{
		this.m.ID = "TopbarRoundInformationModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.clearEventListener();
		this.ui_module.destroy();
	}

	function update()
	{
		this.m.JSHandle.asyncCall("update", this.onQueryRoundInformation());
	}

	function onQueryRoundInformation()
	{
		if (this.m.OnQueryRoundInformationListener != null)
		{
			return this.m.OnQueryRoundInformationListener();
		}

		return null;
	}

});

