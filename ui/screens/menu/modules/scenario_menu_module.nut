this.scenario_menu_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		OnPlayButtonPressedListener = null,
		OnCancelButtonPressedListener = null,
		OnQueryDataListener = null
	},
	function setOnPlayButtonPressedListener( _listener )
	{
		this.m.OnPlayButtonPressedListener = _listener;
	}

	function setOnCancelButtonPressedListener( _listener )
	{
		this.m.OnCancelButtonPressedListener = _listener;
	}

	function setOnQueryDataListener( _listener )
	{
		this.m.OnQueryDataListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnPlayButtonPressedListener = null;
		this.m.OnCancelButtonPressedListener = null;
		this.m.OnQueryDataListener = null;
	}

	function create()
	{
		this.m.ID = "ScenarioMenuModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.clearEventListener();
		this.ui_module.destroy();
	}

	function show()
	{
		if (!this.isVisible() && !this.isAnimating())
		{
			this.m.JSHandle.asyncCall("show", null);
		}
	}

	function hide()
	{
		if (this.isVisible() && !this.isAnimating())
		{
			this.m.JSHandle.asyncCall("hide", null);
		}
	}

	function onPlayButtonPressed( _scenarioId )
	{
		if (this.m.OnPlayButtonPressedListener != null)
		{
			this.m.OnPlayButtonPressedListener(_scenarioId);
		}
	}

	function onCancelButtonPressed()
	{
		if (this.m.OnCancelButtonPressedListener != null)
		{
			this.m.OnCancelButtonPressedListener();
		}
	}

	function onQueryData()
	{
		if (this.m.OnQueryDataListener != null)
		{
			return this.m.OnQueryDataListener();
		}

		return null;
	}

});

