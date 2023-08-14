this.main_menu_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		OnResumePressedListener = null,
		OnNewCampaignPressedListener = null,
		OnLoadCampaignPressedListener = null,
		OnSaveCampaignPressedListener = null,
		OnScenariosPressedListener = null,
		OnOptionsPressedListener = null,
		OnCreditsPressedListener = null,
		OnQuitPressedListener = null,
		OnFleePressedListener = null,
		OnRetirePressedListener = null,
		OnNewLegendCampaignPressedListener = null
	},
	function setOnResumePressedListener( _listener )
	{
		this.m.OnResumePressedListener = _listener;
	}

	function setOnNewCampaignPressedListener( _listener )
	{
		this.m.OnNewCampaignPressedListener = _listener;
	}

	function setOnNewLegendCampaignPressedListener( _listener )
	{
		this.m.OnNewLegendCampaignPressedListener = _listener;
	}

	function setOnLoadCampaignPressedListener( _listener )
	{
		this.m.OnLoadCampaignPressedListener = _listener;
	}

	function setOnSaveCampaignPressedListener( _listener )
	{
		this.m.OnSaveCampaignPressedListener = _listener;
	}

	function setOnScenariosPressedListener( _listener )
	{
		this.m.OnScenariosPressedListener = _listener;
	}

	function setOnOptionsPressedListener( _listener )
	{
		this.m.OnOptionsPressedListener = _listener;
	}

	function setOnCreditsPressedListener( _listener )
	{
		this.m.OnCreditsPressedListener = _listener;
	}

	function setOnQuitPressedListener( _listener )
	{
		this.m.OnQuitPressedListener = _listener;
	}

	function setOnFleePressedListener( _listener )
	{
		this.m.OnFleePressedListener = _listener;
	}

	function setOnRetirePressedListener( _listener )
	{
		this.m.OnRetirePressedListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnResumePressedListener = null;
		this.m.OnNewCampaignPressedListener = null;
		this.m.OnLoadCampaignPressedListener = null;
		this.m.OnSaveCampaignPressedListener = null;
		this.m.OnScenariosPressedListener = null;
		this.m.OnOptionsPressedListener = null;
		this.m.OnCreditsPressedListener = null;
		this.m.OnQuitPressedListener = null;
		this.m.OnFleePressedListener = null;
		this.m.OnRetirePressedListener = null;
		this.m.OnNewLegendCampaignPressedListener = null;
	}

	function create()
	{
		this.m.ID = "MainMenuModule";
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

	function onResumeButtonPressed()
	{
		if (this.m.OnResumePressedListener != null)
		{
			this.m.OnResumePressedListener();
		}
	}

	function onNewCampaignButtonPressed()
	{
		if (this.m.OnNewCampaignPressedListener != null)
		{
			this.m.OnNewCampaignPressedListener();
		}
	}

	function onNewLegendCampaignButtonPressed()
	{
		if (this.m.OnNewLegendCampaignPressedListener != null)
		{
			this.m.OnNewLegendCampaignPressedListener();
		}
	}

	function onLoadCampaignButtonPressed()
	{
		if (this.m.OnLoadCampaignPressedListener != null)
		{
			this.m.OnLoadCampaignPressedListener();
		}
	}

	function onSaveCampaignButtonPressed()
	{
		if (this.m.OnSaveCampaignPressedListener != null)
		{
			this.m.OnSaveCampaignPressedListener();
		}
	}

	function onScenariosButtonPressed()
	{
		if (this.m.OnScenariosPressedListener != null)
		{
			this.m.OnScenariosPressedListener();
		}
	}

	function onOptionsButtonPressed()
	{
		if (this.m.OnOptionsPressedListener != null)
		{
			this.m.OnOptionsPressedListener();
		}
	}

	function onCreditsButtonPressed()
	{
		if (this.m.OnCreditsPressedListener != null)
		{
			this.m.OnCreditsPressedListener();
		}
	}

	function onQuitButtonPressed()
	{
		if (this.m.OnQuitPressedListener != null)
		{
			this.m.OnQuitPressedListener();
		}
	}

	function onFleeButtonPressed()
	{
		if (this.m.OnFleePressedListener != null)
		{
			this.m.OnFleePressedListener();
		}
	}

	function onRetireButtonPressed()
	{
		if (this.m.OnRetirePressedListener != null)
		{
			this.m.OnRetirePressedListener();
		}
	}

});

