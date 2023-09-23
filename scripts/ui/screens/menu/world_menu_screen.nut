this.world_menu_screen <- {
	m = {
		JSHandle = null,
		MainMenuModule = null,
		LoadCampaignModule = null,
		SaveCampaignModule = null,
		OptionsMenuModule = null,
		Visible = null,
		Animating = null,
		OnConnectedListener = null,
		OnDisconnectedListener = null,
		OnScreenShownListener = null,
		OnScreenHiddenListener = null
	},
	function isVisible()
	{
		return this.m.Visible != null && this.m.Visible == true;
	}

	function isAnimating()
	{
		if (this.m.Animating != null && this.m.MainMenuModule != null && this.m.OptionsMenuModule != null)
		{
			return this.m.Animating == true || this.m.MainMenuModule.isAnimating() || this.m.OptionsMenuModule.isAnimating();
		}
		else
		{
			return false;
		}
	}

	function isMainMenuVisible()
	{
		return this.m.MainMenuModule.isVisible();
	}

	function isOptionsMenuVisible()
	{
		return this.m.OptionsMenuModule.isVisible();
	}

	function getMainMenuModule()
	{
		return this.m.MainMenuModule;
	}

	function getLoadCampaignMenuModule()
	{
		return this.m.LoadCampaignModule;
	}

	function getSaveCampaignMenuModule()
	{
		return this.m.SaveCampaignModule;
	}

	function getOptionsMenuModule()
	{
		return this.m.OptionsMenuModule;
	}

	function setOnConnectedListener( _listener )
	{
		this.m.OnConnectedListener = _listener;
	}

	function setOnDisconnectedListener( _listener )
	{
		this.m.OnDisconnectedListener = _listener;
	}

	function setOnScreenShownListener( _listener )
	{
		this.m.OnScreenShownListener = _listener;
	}

	function setOnScreenHiddenListener( _listener )
	{
		this.m.OnScreenHiddenListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnConnectedListener = null;
		this.m.OnDisconnectedListener = null;
		this.m.OnScreenShownListener = null;
		this.m.OnScreenHiddenListener = null;
	}

	function create()
	{
		this.m.Visible = false;
		this.m.Animating = false;
		this.m.JSHandle = this.UI.connect("WorldMenuScreen", this);
		this.m.MainMenuModule = this.new("scripts/ui/screens/menu/modules/main_menu_module");
		this.m.MainMenuModule.connectUI(this.m.JSHandle);
		this.m.LoadCampaignModule = this.new("scripts/ui/screens/menu/modules/load_campaign_menu_module");
		this.m.LoadCampaignModule.connectUI(this.m.JSHandle);
		this.m.SaveCampaignModule = this.new("scripts/ui/screens/menu/modules/save_campaign_menu_module");
		this.m.SaveCampaignModule.connectUI(this.m.JSHandle);
		this.m.OptionsMenuModule = this.new("scripts/ui/screens/menu/modules/options_menu_module");
		this.m.OptionsMenuModule.connectUI(this.m.JSHandle);
	}

	function destroy()
	{
		this.clearEventListener();
		this.m.MainMenuModule.destroy();
		this.m.MainMenuModule = null;
		this.m.LoadCampaignModule.destroy();
		this.m.LoadCampaignModule = null;
		this.m.SaveCampaignModule.destroy();
		this.m.SaveCampaignModule = null;
		this.m.OptionsMenuModule.destroy();
		this.m.OptionsMenuModule = null;
		this.m.JSHandle = this.UI.disconnect(this.m.JSHandle);
	}

	function show( _allowSaving = true, _seed = 0 )
	{
		local data = {
			Mode = "world",
			IsSavingAllowed = _allowSaving,
			Seed = _seed
		};

		if (this.m.JSHandle != null && !this.isVisible())
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("show", data);
		}

		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _t )
		{
			this.Tooltip.hide();
		}, null);
	}

	function hide()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("hide", null);
		}
	}

	function showLoadCampaignMenu()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showLoadCampaignMenu", this.UIDataHelper.convertCampaignStoragesToUIData());
		}
	}

	function hideLoadCampaignMenu()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("hideLoadCampaignMenu", null);
		}
	}

	function showSaveCampaignMenu()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showSaveCampaignMenu", this.UIDataHelper.convertCampaignStoragesToUIData());
		}
	}

	function hideSaveCampaignMenu()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("hideSaveCampaignMenu", null);
		}
	}

	function showOptionsMenu()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.JSHandle.asyncCall("showOptionsMenu", this.m.OptionsMenuModule.onQueryData());
		}
	}

	function hideOptionsMenu()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.JSHandle.asyncCall("hideOptionsMenu", null);
		}
	}

	function onScreenConnected()
	{
		if (this.m.OnConnectedListener != null)
		{
			this.m.OnConnectedListener();
		}
	}

	function onScreenDisconnected()
	{
		if (this.m.OnDisconnectedListener != null)
		{
			this.m.OnDisconnectedListener();
		}
	}

	function onScreenShown()
	{
		this.m.Visible = true;
		this.m.Animating = false;

		if (this.m.OnScreenShownListener != null)
		{
			this.m.OnScreenShownListener();
		}
	}

	function onScreenHidden()
	{
		this.m.Visible = false;
		this.m.Animating = false;

		if (this.m.OnScreenHiddenListener != null)
		{
			this.m.OnScreenHiddenListener();
		}
	}

	function onScreenAnimating()
	{
		this.m.Animating = true;
	}

};

