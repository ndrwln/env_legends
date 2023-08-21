this.load_campaign_menu_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		OnLoadButtonPressedListener = null,
		OnCancelButtonPressedListener = null,
		OnDeleteButtonPressedListener = null
	},
	function setOnLoadButtonPressedListener( _listener )
	{
		this.m.OnLoadButtonPressedListener = _listener;
	}

	function setOnCancelButtonPressedListener( _listener )
	{
		this.m.OnCancelButtonPressedListener = _listener;
	}

	function setOnDeleteButtonPressedListener( _listener )
	{
		this.m.OnDeleteButtonPressedListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnLoadButtonPressedListener = null;
		this.m.OnCancelButtonPressedListener = null;
		this.m.OnDeleteButtonPressedListener = null;
	}

	function create()
	{
		this.m.ID = "LoadCampaignModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.clearEventListener();
		this.ui_module.destroy();
	}

	function show()
	{
		if (!this.isAnimating())
		{
			this.m.JSHandle.asyncCall("show", null);
		}
	}

	function hide()
	{
		if (!this.isAnimating())
		{
			this.m.JSHandle.asyncCall("hide", null);
		}
	}

	function onQueryCampaigns()
	{
		return this.UIDataHelper.convertCampaignStoragesToUIData();
	}

	function onLoadButtonPressed( _campaignFileName )
	{
		if (this.m.OnLoadButtonPressedListener != null)
		{
			this.m.OnLoadButtonPressedListener(_campaignFileName);
		}
	}

	function onCancelButtonPressed()
	{
		if (this.m.OnCancelButtonPressedListener != null)
		{
			this.m.OnCancelButtonPressedListener();
		}
	}

	function onDeleteButtonPressed( _campaignFileName )
	{
		this.PersistenceManager.deleteStorage(_campaignFileName);
		this.m.JSHandle.asyncCall("addCampaignsToList", this.onQueryCampaigns());

		if (this.m.OnDeleteButtonPressedListener != null)
		{
			this.m.OnDeleteButtonPressedListener();
		}
	}

});

