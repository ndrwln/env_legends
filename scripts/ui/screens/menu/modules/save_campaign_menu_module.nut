this.save_campaign_menu_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		OnSaveButtonPressedListener = null,
		OnCancelButtonPressedListener = null,
		OnDeleteButtonPressedListener = null
	},
	function setOnSaveButtonPressedListener( _listener )
	{
		this.m.OnSaveButtonPressedListener = _listener;
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
		this.m.OnSaveButtonPressedListener = null;
		this.m.OnCancelButtonPressedListener = null;
		this.m.OnDeleteButtonPressedListener = null;
	}

	function create()
	{
		this.m.ID = "SaveCampaignModule";
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

	function onSaveButtonPressed( _campaignFileName )
	{
		if (this.m.OnSaveButtonPressedListener != null)
		{
			this.m.OnSaveButtonPressedListener(_campaignFileName);
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

